setwd("~/Documents/Projects/ELFIE/ELFIE/Tools/R/")
source("json_ld_functions.R")

unlink("cache/*")

use_cases <- list(FR_surface_ground_water_level_forecast = list(data_path = "../../data/FR_surface_ground_water_level_forecast",
                                  name = "Surface Water Ground Water Level Forecast",
                                  id = "sgwlf"),
                  FR_surface_ground_water_interaction = list(data_path = "../../data/FR_surface_ground_water_interaction",
                              name = "Surface Water Ground Water Interaction",
                              id = "sgwi"),
                  FR_surface_ground_surface_roundtrip = list(data_path = "../../data/FR_surface_ground_surface_roundtrip",
                            name = "Surface Water Ground Water Roundtrip",
                            id = "sgsr"))

for(use_case in use_cases) {
  data_path <- use_case$data_path
  data_files <- list.files(data_path, pattern = "*.json")
  
  write_use_case_name(out_md, use_case)
  
  for(data_file in data_files) {
    print(data_file)
    
    id_parts <- stringr::str_split(stringr::str_replace(data_file, ".json", ""), "_")[[1]]
    
    write_feature_type_title(out_md, id_parts[1])
    
    id_base <- paste("FR", id_parts[1], use_case$id, sep = "/")
      
    out_path <- file.path(out_path_base, id_base)
    
    id <- paste(id_base, id_parts[2], sep = "/")
    
    if(!dir.exists(out_path)) dir.create(out_path, recursive = T)
      
    file.copy(file.path(data_path, data_file), file.path(out_path, paste0(id_parts[2], ".json")), overwrite = T)
    
    json_data <- jsonlite::fromJSON(file.path(data_path, data_file))
    
    context_out <- jsonlite::toJSON(get_context_out(json_data), pretty = T, auto_unbox = T)
    
    json_out <- jsonlite::toJSON(json_data, pretty = T, auto_unbox = T)
    
    whisker_list <- list(context = context_out, 
                         `json-ld` = json_out, 
                         page_title = id)
    
    writeLines(whisker::whisker.render(readLines("html_template.html"), whisker_list),
               file.path(out_path, paste0(id_parts[2], ".html")))
    
    write_url_line(out_md, paste(elf_url_base, id, sep = "/"))
  }
  write("  \n", out_md, append = T)
}

unlink("cache/*")
