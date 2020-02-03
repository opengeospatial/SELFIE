setwd("~/Documents/Projects/ELFIE/ELFIE/data/huc12obs/")

library(jsonlite)

wqp <- fromJSON("usgs_wqp_huc12obs.json")
wqp_ids <- wqp$features$properties$identifier

# library(dataRetrieval)
# sites <- list()
# for(site in wqp_ids) {
#   sites[site] <- list(whatWQPsites(siteid=site))
# }
# saveRDS(sites, "usgs_wqp_070900020601.rds")

sites <- readRDS("usgs_wqp_huc12obs.rds")

preds <- c("jsonkey_identifier", "rdfs:type", "schema:name", "schema:subjectOf", "hyf:hydrometricNetwork")

wqp_site_info <- data.frame(matrix(nrow = length(sites), ncol = length(preds)))

names(wqp_site_info) <- preds
rownames(wqp_site_info) <- names(sites)

for(site in names(sites)) {
  wqp_site_info[site,"jsonkey_identifier"] <- sites[site][[1]]$MonitoringLocationIdentifier
  wqp_site_info[site, "rdfs:type"] <- "https://www.opengis.net/def/appschema/hy_features/hyf/HY_HydrometricFeature"
  wqp_site_info[site, "schema:name"] <- sites[site][[1]]$MonitoringLocationName
  wqp_site_info[site, "schema:subjectOf"] <- paste0("https://www.waterqualitydata.us/provider/STORET/", 
                                              sites[site][[1]]$OrganizationIdentifier, "/",
                                              sites[site][[1]]$MonitoringLocationIdentifier)
  wqp_site_info[site, "hyf:hydrometricNetwork"] <- "elfie/usgs/hydrometricnetwork/huc12obs/070900020601" 
}
  
write.table(wqp_site_info, file = "usgs_wqp_huc12obs.tsv", sep = "\t", row.names = F)  
  
network_link_list <- paste0("elfie/usgs/wqp/huc12obs/", names(sites), collapse = "_|_")
