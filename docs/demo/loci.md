# SELFIE Demonstration Write Up: Loc-I


## Use Case Descrition


<!--

this is talking about a “domain” use case (SELFIE is the technical use-case — 🤪)

-->

The [Location Index](http://locationindex.org) (Loc-I) project aims to enable capability for integrating and analysis of spatio-temporal data in a reliable, effective and efficient manner across information domains and organisations, initially focusing on the public sector agencies in Australia. 
These include social, economic, business, and environmental data with location references embedded within the data (e.g. census district, water drainage regions, and address identifiers).
Loc-I is part of the Data Integration Partnership for Australia (DIPA) initiative, which seeks to maximise government data to improve policy advice. 

| Demo | Link |
|----- | ---- |
| [Loc-I Explorer](https://explorer.loci.cat/) - interactive demonstrator for user discovery of location features by a geo-point, or a location label. | [https://explorer.loci.cat/](https://explorer.loci.cat/) |
| Loc-I Integration API Search by label | [https://api2.loci.cat/api/v1/location/find-by-label?query=50055290000](https://api2.loci.cat/api/v1/location/find-by-label?query=50055290000) |
| Location resource (ASGS) landing page |  [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000) |
| Location resource (ASGS) alternates views | [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_view=alternates](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_view=alternates) |
| Location resource (ASGS) RDF/Turtle view | [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=text/turtle](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=turtle) |
| Location resource (ASGS) JSON-LD view | [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=application/ld+json](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=application/ld+json) |



### User Story



<!--

Who is this person we call user? Help make them real.

-->

Helga is an *Enterprise data warehouse manager* that manages data warehouse of a public sector organisation. 
The data warehouse contains observation data which is captured by researchers in her organisation. 
The observation database captures data and includes a field for  location. 
The location information values captured is varied and can include: textual description, place name, region according to a specific geographic classification, GPS location (lat-long). 
Helga would like to harmonise location information so that they are consistently and precisely captured and requires a tool for searching, resolving and consistently referring to the location.
 

### Datasets and Sources



<!---

Use this section to document your data and the distributed network of data providers.

Alude to the non information resource and information content that satisfies the use

case. Discussion of how the unique use case uses the SELFIE "core" concepts should be

included here.

--->



- [Australian Statistical Geography Standard](https://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+(ASGS)) (ASGS) published by the Australian Bureau of Statistics. 
- [ASGS MeshBlocks 2016](https://www.abs.gov.au/ausstats/abs@.nsf/Lookup/by%20Subject/1270.0.55.001~July%202016~Main%20Features~Mesh%20Blocks%20(MB)~10012) is a set of geographical areas defined by the ABS and are used as building blocks for the larger regions of the ASGS. MeshBlock area identifiers are embedded in observation data such as the [2074.0 - Census of Population and Housing: Mesh Block Counts, Australia, 2016](https://www.abs.gov.au/ausstats/abs@.nsf/mf/2074.0).


## Demo Description and Links

Helga, the Enterprise Data Warehouse manager, is creating ETL scripts to append Loc-I identifiers to the data warehouse she is managing for references to location by label or ID.


<!--

Also add one or more screenshots or other graphics with a descriptive caption for each.  

Add screenshots to https://github.com/opengeospatial/ELFIE/tree/master/docs/images 

so they show up at a path like: `https://opengeospatial.github.io/ELFIE/images/ELFIE_logo.png`  

-->


### Links to Demo Resources

Helga uses the [Loc-I Explorer](https://explorer.loci.cat/) app to discover location features by label.

The Loc-I Explorer app fires off a query to the Loc-I Integration API, specifically the Search by label API at [https://api2.loci.cat/api/v1/location/find-by-label?query=50055290000](https://api2.loci.cat/api/v1/location/find-by-label?query=50055290000) 

Helga gets a list of matching resources in the results page of the Loc-I Explorer. 

Helga clicks on the Loc-I resource link to verify that it's the right one and gets the landing page: [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000) which is redirected to the info resource https://asgsld.net/2016/object?uri=http%3A%2F%2Flinked.data.gov.au%2Fdataset%2Fasgs2016%2Fmeshblock%2F50055290000.

Helga clicks on the link to alternates views to check-out what other views and formats are available: [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_view=alternates](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_view=alternates) which 303 redirects to https://asgsld.net/2016/object?uri=http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000&_view=alternates.

Helga views the MB Location resource in RDF/Turtle format: [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=text/turtle](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=turtle) which 303 redirects to https://asgsld.net/2016/object?_view=asgs&_format=text%2Fturtle&uri=http%3A%2F%2Flinked.data.gov.au%2Fdataset%2Fasgs2016%2Fmeshblock%2F50055290000. 

Helga views the MB Location resource in JSON-LD format: Location resource (ASGS) JSON-LD view: [http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=application/ld+json](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_format=application/ld+json) which 303 redirects to https://asgsld.net/2016/object?_view=asgs&_format=application%2Fld+json&uri=http%3A%2F%2Flinked.data.gov.au%2Fdataset%2Fasgs2016%2Fmeshblock%2F50055290000.

Helga resolves the `wfs` view for the MB Location resource in:
[http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_view=wfs](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_view=wfs) which 303 redirects to https://geo.abs.gov.au/arcgis/services/ASGS2016/MB/MapServer/WFSServer?service=wfs&version=2.0.0&request=GetFeature&typeName=MB:MB&Filter=%3Cogc:Filter%3E%3Cogc:PropertyIsEqualTo%3E%3Cogc:PropertyName%3EMB:MB_CODE_2016%3C/ogc:PropertyName%3E%3Cogc:Literal%3E50055290000%3C/ogc:Literal%3E%3C/ogc:PropertyIsEqualTo%3E%3C/ogc:Filter%3E.

Helga is satisfied with the resource and embeds the Loc-I identifier ([http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000](http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000)) in the data warehouse and makes a note in the row about the WFS view along with its link (http://linked.data.gov.au/dataset/asgs2016/meshblock/50055290000?_view=wfs).


## Demo findings and potential next steps


<!-- Discuss issues that this demo works around or would otherwise need to be solved to take it from demonstration/experiment to production. Talk about how the SELFIE core of 303 redirection and use of JSON-LD in HTML landing pages works in the context of the complete technical setting of your use case. Discussion of what future experimentation is needed should go here. -->

The demo uses NIR for identifying the resource (MeshBlock), its views, and its formats. 
This provides a separation between the NIR, which has been setup with `http://linked.data.gov.au/dataset/asgs2016/` namespace prefixes arranged with the Australian Linked Data Working Group (ALDWG), and the implementation site `http://asgsld.net`. 
The intention was to provide flexibility in case the implementation sites needed to change or move. 
The status of `asgsld.net` is a research operations grade resource, and we are exploring production operations grade hosting arrangements. 
However, the advantage of the way Loc-I NIRs are minted means that we should not need to change once the production operations grade hosting arrangements are determined.

In this case, it is important that any downstream applications and clients to use the NIRs and resolve them so the applications and clients are not affected by any changes to the underlying implementations.

A limitation of the current demo is that the current ASGS landing page doesn't embed any JSON-LD (with  schema.org tags). For indexing by search engines for discovery by search engines (e.g. Google), we would like to explore adding this in as per the ELFIE/SELFIE recommended discovery profile view.
