source("json_ld_functions.R")

use_case <- list(data_path = "huc12obs", name = "Observations for a Hydrologic Unit")

unlink("cache/*")

created_ids <- list()

data_path <- use_case$data_path
data_files <- list.files(data_path, pattern = "*.tsv")

for(data_file in data_files) {
  print(data_file)
  
  feature_type <- stringr::str_replace(data_file, ".tsv", "")
  
  # write_feature_type_title(out_md, feature_type)
  
  id_base <- paste(stringr::str_split(feature_type, "_")[[1]], collapse = "/")
  
  out_path <- file.path(out_path_base, id_base)
  
  if(!dir.exists(out_path)) dir.create(out_path, recursive = T)
  
  tsv_data <- readr::read_delim(file.path(data_path, data_file), delim = "\t", col_types = readr::cols())
  
  geojson_file <- stringr::str_replace(data_file, ".tsv", ".json")
  
  try(rm(geojson), silent = T)
  
  try(geojson <- sf::st_read(file.path(data_path, geojson_file), check_ring_dir = TRUE, quiet = TRUE), silent = T)
  
  if(!exists("geojson")) {
    try(geojson <- sf::st_read(file.path(data_path, geojson_file), quiet = TRUE), silent = T)
  }
  
  joiner <- stringr::str_replace(names(tsv_data)[1], "jsonkey_", "")
  
  try(matcher <- match(tsv_data[,1][[1]], geojson[[joiner]]), silent = T)
  
  if(joiner == "") matcher <- 1
  
  for(i in 1:nrow(tsv_data)) {
    elf_index_list <- build_elf_index_list(id_base, tsv_data[i,], include_missing = F)
    
    if(any(grepl("hyf:", names(tsv_data))) || any(grepl("fc:", names(tsv_data)))) {
      elf_net_hyf_list <- build_hyf_net(tsv_data[i,], elf_index_list$`@id`)
      elf_net_hyf_sublist <- elf_net_hyf_list
      elf_net_hyf_sublist[c("@context", "@id", "@type")] <- NULL
      
      elf_index_list$`@context` <- c(elf_index_list$`@context`, elf_net_hyf_list$`@context`)
      
      elf_index_list <- c(elf_index_list, elf_net_hyf_sublist)
    }
    
    if(any(grepl("time:", names(tsv_data))) || any(grepl("gsp:", names(tsv_data)))) {
      elf_net_list <- build_elf_net(tsv_data[i,], elf_index_list$`@id`)
      elf_net_sublist <- elf_net_list
      elf_net_sublist[c("@context", "@id", "@type")] <- NULL
      
      elf_index_list$`@context` <- c(elf_index_list$`@context`, elf_net_list$`@context`)
      
      elf_index_list <- c(elf_index_list, elf_net_sublist)
    }
    
    if(any(grepl("sosa:", names(tsv_data)))) {
      elf_sosa_list <- build_sosa(tsv_data[i,], elf_index_list$`@id`)
      elf_sosa_sublist <- elf_sosa_list
      elf_sosa_sublist[c("@context", "@id", "@type")] <- NULL
      
      elf_index_list$`@context` <- c(elf_index_list$`@context`, elf_sosa_list$`@context`)
      
      elf_index_list <- c(elf_index_list, elf_sosa_sublist)
    }
    
    if(exists("geojson")) {
      try({geojson_f <- geojson[matcher[i],]
      geojson_out <- paste0(tsv_data[i,][1], ".geojson")
      
      schema_geo <- build_schema_geo(geojson_f,
                                     geojson_id = paste(elf_url_base, id_base, 
                                                        geojson_out, sep = "/"))
      
      schema_geo_sublist <- schema_geo
      schema_geo_sublist[c("@context", "@id", "@type")] <- NULL
      
      elf_index_list$`@context` <- c(elf_index_list$`@context`, schema_geo$`@context`)
      
      elf_index_list <- c(elf_index_list, schema_geo_sublist)
      
      if(!any(grepl("sosa:", names(tsv_data)))) {
        # This is a hack. remove when gsp is in the main elf.jsonld
        elf_index_list$`@context` <- c(elf_index_list$`@context`, list(list(gsp = "http://www.opengeospatial.org/standards/geosparql/")))
      }
      
      geojson_out <- file.path(out_path, geojson_out)
      
      unlink(geojson_out)
      
      sf::write_sf(geojson_f, 
                   geojson_out, 
                   driver = "GeoJSON", 
                   layer_options = c("WRITE_NAME=NO", "RFC7946=YES"))
      })}
    
    jsonlite::write_json(elf_index_list, 
                         file.path(out_path, paste0(tsv_data[i,][1], ".json")),
                         pretty = TRUE, auto_unbox = T)
    
    created_ids <- c(created_ids, elf_index_list$`@id`)
  }
}

library(xml2)

make_mapping <- function(path, target, creator, type = "1:1", 
                         description = "", action = "303", 
                         action_name = "location") {
  list(mapping = list(path = list(path), 
                      type = list(type), 
                      description = list(description), 
                      creator = list(creator),
                      action = list(type = list(action),
                                    name = list(action_name),
                                    value = list(target)),
                      conditions = list(condition = list(type = list("Extension"),
                                                         match = list("^json$"),
                                                         actions = list(action = list(type = list(action),
                                                                                      name = list(action_name),
                                                                                      value = list(paste0(target, ".json"))))),
                                        condition = list(type = list("Extension"),
                                                         match = list("^geojson$"),
                                                         actions = list(action = list(type = list(action),
                                                                                      name = list(action_name),
                                                                                      value = list(paste0(target, ".geojson"))))))))
}

mappings <- lapply(created_ids, function(id) {
  make_mapping(gsub("https://geoconnex.us", "", id),
               gsub("https://geoconnex.us", "https://opengeospatial.github.io", id), 
               creator = "dblodgett@usgs.gov", 
               description = "made SELFIE testing")
})

registered_ids <- lapply(created_ids, function(id) {
  list(id = id, target = gsub("https://geoconnex.us", "https://opengeospatial.github.io", id), 
       creator = "dblodgett@usgs.gov", description = "made SELFIE testing")
})

registered_ids <- do.call(dplyr::bind_rows, registered_ids)

registered_ids$c1_type <- "Extension"
registered_ids$c1_match <- "^.html$"
registered_ids$c1_value <- paste0(registered_ids$target, ".html")

registered_ids$c2_type <- "Extension"
registered_ids$c2_match <- "^.json$"
registered_ids$c2_value <- paste0(registered_ids$target, ".json")

registered_ids$c3_type <- "Extension"
registered_ids$c3_match <- "^.geojson$"
registered_ids$c3_value <- paste0(registered_ids$target, ".geojson")

readr::write_csv(registered_ids, "SELFIE_ids.csv")

attr(mappings, "xmlns") <- "urn:csiro:xmlns:pidsvc:backup:1.0"

out <- list(backup = mappings)
doc <- as_xml_document(out)

xml2::write_xml(doc, "test.xml")

for(id in created_ids) {
  js <- prefetch_ids(id)
  
  json_out <- jsonlite::toJSON(js, 
                               pretty = T, 
                               auto_unbox = T)
  
  writeLines(json_out, elfie_url_local(id))
  
  context_out <- get_context_out(jsonlite::fromJSON(json_out))
  
  context_out <- jsonlite::toJSON(context_out, pretty = T, auto_unbox = T)
  
  whisker_list <- list(context = list(context_out), 
                       `json-ld` = json_out, 
                       page_title = gsub("../../docs", "", elfie_url_local(id)),
                       feature_name = js$name,
                       feature_desc = js$description,
                       feature_type = js$`@type`,
                       feature_id = js$`@id`,
                       feature_image = js$image)
  
  writeLines(whisker::whisker.render(readLines("html_template.html"), 
                                     whisker_list),
             file.path(gsub(".json", ".html", elfie_url_local(id))))
}

unlink("cache/*")
