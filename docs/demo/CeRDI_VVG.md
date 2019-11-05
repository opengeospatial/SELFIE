# CeRDI VVG - SELFIE Demonstration

## Use Case Description

To provide a means whereby all the relevant information (resources) about a real world feature (in this case a borehole or well) 
can be brought together via a machine readable (and indexable) 'page/not a page'  

[**CeRDI SELFIE testbed**](https://geo.org.au/info/well/46217)

### User Story

Groundwater bore data management in Victoria is split across a number of Government departments, research agencies and community groups. 
Information about the same real-world entity borehole may exist in multiple databases.  The VVG web portal partly 
addressed this problem by federating these disparate data services into a spatial web portal 
that allows the user to access ALL the information regardless of the source or duplication. [**History of Bore data in Victoria**](https://www.vvg.org.au/cb_pages/history_of_bore_data.php) 

Information about a borehole exists at one or more of:
- Geological Survey of Victoria (GSV)
- Department of Environment, Land, Water and Planning (DELWP)
- State Library of Victoria (SLV)
- Federation Univesity Australia (FedUni)

These are services deliver one or more of:
-	HTML
-	GML
-	JSON
-	Documents / multimedia

The data from these services may be about:
-	Geology / Aquifers
-	Groundwater (water quality, levels)
-	Borehole construction
-	Reports
-	Observations made on things intersected in the bore

Currently the user must individually discover and access these different data services 
and compile the relevant information about a Borehole manually. Where the same borehole 
exists aross multiple data sources its is not readily apparent that they are the same real world feature (there is no common identifier across these services). Additionally 
there is no mechanism to identify the different types of information available.

Through this demonstration a user should be able to use a standard search engine to discover the availability of these various sources, formats and contents via a MetaResource (MR).
The user (including machines) can navigate via the links in the MR to request data from the various providers in one of the available formats.



### Datasets

- Geological Survey of Victoria (GSV) - [**Geological Exploration and Development Information System (GEDIS)**](https://www.vvg.org.au/cb_pages/gedis.php)
- Department of Environment, Land, Water and Planning (DELWP) - [**Water Measurement Information System (WMIS)**](https://www.vvg.org.au/cb_pages/wmis.php)
- Federation University Australia - [**Groundwater research bores**](https://www.vvg.org.au/cb_pages/ub_spatial_bore_database.php)
- State Library of Victoria (SLV) - [**Boring Records**](https://www.vvg.org.au/cb_pages/digitisation_of_historical_records.php)
- Environmental Protection Authority Victoria (EPA) - TBC

## Demo Description and Links

####What have we done so far: 
The demo is currently designed to expose a single borehole via its real-world identifier. 
1. The application resolves a URI pattern for the real-world-feature of the form https://geo.org.au/id/well/46217 which performs a 303 redirect to a SELFIE Meta Resource (MR)
https://geo.org.au/info/46217

2. The application then uses a lookup tool (rosetta stone) to determine which of the various data providers 
have a corresponding borehole and the source-specific ID needed to access that data resource (DR). 

3. Basic Content Negotiation via accepts header caters for both HTML (with embedded JSON-LD) and straight JSON-LD.
The format can be overrided with either a .json or ?f=json in the URI   
For the JSON-LD the MR encodes the various representations (DRs) into the SubjectOf block. 

JSON LD Example
[**https://geo.org.au/info/well/46217?f=json**](https://geo.org.au/info/well/46217?f=json) 

We have included Images and Reports where they are available

Photos/Reports: [**https://geo.org.au/info/well/WA1**](https://geo.org.au/info/well/WA1)

State library Archives [**https://geo.org.au/info/well/326217**](https://geo.org.au/info/well/326217)

For the data resources (DRs) in most cases we were starting with existing WFS services delivering complex features as GML. 
We have made use of Alistair Ritchie's WFS mediator to allow on-the-fly conversion of the GML into JSON-LD and HTML (as implemented in ELFIE-1)
We have not been able to validate these yet apart from checking that they generate something that looks like JSON-LD. 

These DRs follow a URI scheme /sourceprovider/data/datatype/featuretype/id

WMIS Service
[**https://id.cerdi.edu.au/wmis/data/gwml2/well/46217?f=json**](https://id.cerdi.edu.au/wmis/data/gwml2/well/46217?f=json) 

GSV service
[**https://id.cerdi.edu.au/gsv/data/gsml2/borehole/46217?f=json**](https://id.cerdi.edu.au/gsv/data/gsml2/borehole/46217?f=json)

We have attempted to generate an ssn-ext:ObservationCollection to provide access to lab data (water quality) via bore ID
[**https://id.cerdi.edu.au/wmis/data/sosa/observationcollection/46217?f=json**](https://id.cerdi.edu.au/wmis/data/sosa/observationcollection/46217?f=json)


 
####What we have not done (Yet): 
There are some fairly major parts of the SELFIE puzzle missing at the moment. 
- At the moment we have not exposed the catalogue of bores (or a way for a search engine to index all bores)  
- We are only in the preliminary stages of generating RDF or TTL formats. Or determining if we need to provide these formats. 
 

### Demo Screenshot(s)

![CeRDI MIR screenshot](https://opengeospatial.github.io/ELFIE/images/SELFIE_MR_Well_html.png)
  

![alt text -- ELFIE Logo](https://opengeospatial.github.io/ELFIE/images/ELFIE_logo.png)

### Links to Demo Resources

Add links to source files, code used, example JSON-LD files, etc. Add descriptive text so 
people can walk through the demo themselves without much prior knowledge. Describe how 
the links in the data can be traversed, especially how the links are/were traversed by the demo
application.

## Demo findings and potential next steps

Discuss issues that this demo works around or would otherwise need to be solved to take
it from demonstration/experiment to production.