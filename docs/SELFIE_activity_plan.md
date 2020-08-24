# Second Environmental Linked Features Interoperability Experiment Activity Plan (Feb 5, 2019)

Abbreviation: SELFIE

## Summary

The initial Environmental Linked Features Interoperability Experiment sought sustainable and automatable solutions to link multi-disciplinary, multi-organization environmental data without the requirement to transfer custody or burden of maintenance of data. It built on W3C best practices, providing guidance and a common approach for encoding environmental feature data and links between and among features and observational data about them. Using these technologies, it bridged the divide between the great flexibility and power of OGC services and the more focused and specific technologies that drive modern web development. 

Building on the content-focused outcomes of the first ELFIE, the Second ELFIE (SELFIE) is designing and vetting Web-resource model and network behavior for cross-domain linked feature data that compliments and uses WFS3 as a building block. This aims to answer the question, how do we use linked data in a way that's compatible with W3C best practices and leverages OGC standards? The experiment aims for focused simplicity, representing resources built from potentially complex data for easy use on the Web. While the IE will test a specific resource model and will follow W3C best practices and OGC standards, a wide range of participant-provided domain-use cases will be used for testing. Ultimately, this work is intended to satisfy the needs of many use cases and many kinds of features, from disaster response and resilience to environmental health and the built environment.

Related OGC groups to engage: WFS3, OWS-Common, Architecture DWG / JSON best practice, OGC-NA, Earth System Science DWG(s).

## Initiators

The OGC members who are initiators of this Interoperability Experiment are:

* U.S. Geological Survey (USGS)

* Natural Resources Canada

* Landcare Research New Zealand Ltd (Manaaki Whenua)

* Bureau de Recherches Géologiques et Minières (BRGM)

## Participants

The following OGC member organizations will participate in the SELFIE

* U.S. Geological Survey

* Manaaki Whenua

* BRGM

* Natural Resources Canada

* DataCove e.U.

## Definitions

**_Resource:_** an item of interest in the distributed network of environmental data.

**_Non-Information Resource_***:* A real-world or conceptual object of interest that is identified by a Uniform Resource Identifier bound to the HTTP protocol (HTTP URI).

**_Information Resource:_** A digital resource that can be sent as a message over the internet using a protocol such as HTTP. Located using a Uniform Resource Locator (URL).

**_Information Index Resource_**: An information resource that provides an index of annotated (metadata) links to information and non-information resources that describe or are related to the non-information resource of interest.

**_HyperText Transfer Protocol Uniform Resource Identifier (HTTP URI)_**: An identifier with the potential to be used with the HTTP protocol to dereference (look up) the identified resource.

**_HyperText Transfer Protocol Uniform Resource Locator (HTTP URL)_**: A type of URI that can be used to locate an information resource. 

**_Data Resource_**: An information resource providing a representation of a non-information resource.

**_Registry_**: Per [ISO 19135, ](https://www.fgdc.gov/standards/organization/FGDC-SWG/meetings/2005/2005-12-20/ISO%2019135.ppt)[Geographic information, Procedures for item registration](https://www.fgdc.gov/standards/organization/FGDC-SWG/meetings/2005/2005-12-20/ISO%2019135.ppt): An information system that manages a set of files containing identifiers assigned to items with descriptions of the associated items.

**_Resource Model_**: A taxonomy and functional description of the system of non-information, index and data resources.

## Description

The IE takes the positive view that a basic API that describes a resource taxonomy and network behavior, or *resource model*, can satisfy an important niche for multi-party integrated data networks such as multi-agency environmental observatories. The proposed resource model includes 1) *non-information resources*, 2) *information index resources*, and 3) *data resources*. The model is intended to be used for dereferencing non-information resource identifiers (HTTP URIs for real world features in this case), providing an index of links to associated features and data. Unlike a typical Web API, in this resource model, only network architecture and HTTP behavior is specified. That is, URI and URL structure will not be the subject of the IE.

### Objectives

The objectives of the SELFIE include:

* Evaluate a proposed resource model for multi-provider environmental feature and observation registries

* Evaluate proposed HTTP behavior for non information resources and their representations

* Design and evaluate linked data feature information index resources with media-type, language, and profile content negotiation as an extension of the building blocks provided by WFS3.

### Background

The ELFIE set of experiments has been defined and implemented using the linked data practices of the semantic web. Consequently, all resources must be identified using HTTP URIs - especially the real world non-information resources of interest. To help distinguish between these real world and digital resources the [httpRange-14 decision](http://lists.w3.org/Archives/Public/www-tag/2005Jun/0039.html) recommended that dereferencing non-information resource identifiers would result in a HTTP 303 (see other) response directing the agent to an appropriate digital representation. However, to date, there are no prominent examples of spatial feature registries that implement this pattern. Furthermore, the [W3C Spatial Data on the Web Best Practice](https://www.w3.org/TR/sdw-bp/#globally-unique-ids) (SDWBP) does not recommend its use in most cases based on guidance from the [W3C Architecture of the World Wide Web, Volume 1 Section 2.2.3](https://www.w3.org/TR/2004/REC-webarch-20041215/#indirect-identification): a URL for an information resource can be considered "to refer indirectly to" a real world thing. Therefore, the SDWBP states, "There is no obligation to distinguish between the Spatial Thing and the page/document unless your application requires this."

The participants in SELFIE believe they have just such an application and, recognizing that this solution is more complicated, it is important to make their reasoning clear up front. The SELFIE community is trying to establish a distributed but interlinked environmental datastore where representations of the same environmental feature may be held by several different providers. The assumption is that this system does require separate identification of information and non-information resources to maintain the ‘referential integrity’ of links within the network. HTTP URIs provide the ‘primary and foreign keys’ that are included in encoded documents and the URI resolver assists with the redirection to actual data. The use of these 303 redirects will be tested as a primary aspect of the IE.

Practically, there is a need to separate 1) the requirements that drive design of HTTP URIs that are governed and meant to be persistent identifiers of real world things from 2) the requirements that drive design of URLs that need to resolve digital resources describing those things. These two sets of requirements are not necessarily compatible because the pattern of a non-information HTTP URI is more meaningful to (is determined by) the process of minting an unambiguous identifier, while the structure of a URL for an information resource is more meaningful to (drives the behavior of) the server that resolves the information resource. By allowing the two to be seperate, the community that governs IDs can create and maintain, ideally indefinitely, HTTP URIs that meet their needs and the community that maintains the information system can create, and potentially modify, URLs that meet their needs. This helps ensure conflicting needs do not have undue impacts on each other's work. This arrangement is both conceptually correct and can be a tool reduce the requirement for these communities (governance of IDs and implementation of information systems) to *have *to interact to achieve the overall goals of the broader community.

<table>
  <tr>
    <td>The following two URLs illustrate the separation of URLs for persistent identification of real world things from URLs for technical information resources:
https://governing_organization/structure/of/identifier/scheme/id
-> 303 redirect to ->
https://technical_orgnization/path/to/register/item/by/resource-id

Another illustration of this is the idea that there are actually three distinct functional roles involved in governing identifiers for use by a broad community.
1: Governance and creation of long-term identifiers.
2: Maintenance of a persistent redirect service that hosts the long-term identifiers.
3: Maintenance of a community information "index" that provides outgoing links to data and related information.</td>
  </tr>
</table>


The IE recognizes (assumes) the need for information hubs and the potential need for an umbrella organization ([see internet of water report for background](https://www.aspeninstitute.org/publications/internet-of-water/)) that, among other roles, index and provide cross-community links to commonly-referenced non-information resources. The content to be provided by such an information index was the subject of the first ELFIE but it was limited to content, not the API resource model or associated behavior that is subject of SELFIE. For this, the WFS3 building blocks provide a potential API pattern for information index resources and will be tested in SELFIE.

From a linked data perspective, SELFIE will include use cases for information index resources that demonstrate linkages between features and observations of them, features that connect in networks, and features that relate across domains. This will include evaluating methods for encoding of links, such as decorating them with feature type or name labels, for informed traversal of the network of links and when those patterns are useful. In other words, the IE will explore what metadata about a link is needed to allow a crawler to decide whether to dereference it or not and which resource types require this link metadata.

The science domain scope will practically be unlimited but the IE is focused on a common solution (API resource model and associated behavior). Finally, as the information index pages will have data available with varied media type, language, and content (profile), the IE will investigate and test content-negotiation for media-type, language, and profile as is expected to be proposed by the W3C DXWG.

Regarding URL permanence, we assume stability of identifiers in general but recognize the need to be resilient to the potential for change to protocols (http -> https) and root domains (ncdc.noaa.gov -> ncei.noaa.gov)

### Use Cases

In order to focus this IE, only environmental domain models describing phenomena relevant to solid earth interactions with the hydrologic cycle will be considered. To ensure the IE outcomes are relevant, important enterprise requirements within and among the considered domains will be used. The following use cases encompass the scope that may be included, the IE will refine and focus these as it progresses.

### Example Experiments

US - Canada Hydrology Linked Data

The US (USGS) and Canada (NRCAN) are implementing national systems of linked surface and groundwater features and observations that are designed to interoperate. Development of new functionality for these systems will be used as part of the SELFIE experiment. 

NZ - Australia Soil Data Commons

Several joint Australia/NZ soil data infrastructure initiatives are in the design phase and expect to adopt the results of ELFIE and SELFIE in their architectures. Manaaki Whenua is contracted to the lead this work and will test SELFIE using the requirements of these projects - broadly speaking integrating distributed soil observation, sensor, mapping and modelling data with important environmental co-variate data (hydrology, geology, climate and landscape). The projects include:

1. The [TERN](https://www.tern.org.au/) Soil research data infrastructure (CSIRO, Australia);

2. The Soil Co-operative Research Centre ([Soil CRC](https://www.soilcrc.com.au/)) Visualizing Australia’s Soils project (Federation University of Australia, Manaaki Whenua, New Zealand)

3. The Pacific Soil Data Portal infrastructure (Manaaki Whenua, New Zealand, CSIRO, Australia, and the [Pacific Soils Partnership](http://www.fao.org/global-soil-partnership/regional-partnerships/pacific/en/)).

EU / FR - Surface Water Groundwater Interactions and Boreholes

Following on the ELFIE use cases contributed by BRGM, interactions between surface water and groundwater features and the monitoring networks associated with them will be explored.

As additional IE participants commit to participation the list of experiments is expected to grow.

## Technical Approach

The Technical Approach for this Interoperability Experiment will follow the practices established for ELFIE.

### Methodology

The methodology involves:

1. refine of use cases developed for ELFIE

2. collate existing practices for the implementation of non-information, information index and data resources

3. define a simple ontology of linked feature resources (resource model)

4. define JSON-LD encoding practices for efficient and effective link crawling (ELFIE-1 based)

5. executing experiments that evaluate the 3 and 4 using publishable implementations (e.g. shared Jupyter Notebooks)

6. evaluate WFS 3.0 compliant services as an ‘engine’ facilitating the creation of the index and data information resources

7. Develop Engineering Report

Note, resource and encoding definitions will be presented in a formal manner (e.g. RDF, SHACL) and as accessible documentation (e.g. in the GitHub wiki).

### Demonstration Planning

The results of the experiment will be demonstrated in several works:

* Regular presentations of experimental progress and results to the OGC Technical Committee

* Publication of background material, information models, definitions and exemplar code in the ELFIE GitHub repository and code sharing tools such as JupyterHub.

* Publication of an Engineering Report.

### Component Development

The following components will be developed as part of ELFIE. Primary responsibility of each component as agreed by participants is included. We assume all participants will contribute to and review the development of all components. The list of experiments may grow as additional collaborators are engaged.

<table>
  <tr>
    <td>Description</td>
    <td>Implementor(s)</td>
  </tr>
  <tr>
    <td>Use cases</td>
    <td>All</td>
  </tr>
  <tr>
    <td>Collation of existing practices</td>
    <td>All</td>
  </tr>
  <tr>
    <td>Resource model</td>
    <td>USGS, MWLR, NRCan</td>
  </tr>
  <tr>
    <td>JSON-LD link encoding</td>
    <td>USGS, MWLR, NRCan</td>
  </tr>
  <tr>
    <td>Experiment: US - Canada Hydrology Linked Data</td>
    <td>USGS, NRCan, CUAHSI</td>
  </tr>
  <tr>
    <td>Experiment: NZ - Australia Soil Data Commons</td>
    <td>MWLR (CSIRO, FedUni - both TBC) </td>
  </tr>
  <tr>
    <td>Experiment: Surface Water Groundwater Interactions and Boreholes</td>
    <td>BRGM</td>
  </tr>
  <tr>
    <td>WFS 3.0 Evaluation</td>
    <td>All</td>
  </tr>
  <tr>
    <td>Engineering Report</td>
    <td>All</td>
  </tr>
</table>


### Testing

Testing will involve:

* Peer review of resource model and encoding practices

* Reproducible implementation of resource model and encoding practices in experimental implementations

* Evaluation of results against relevant OGC specifications and best practices (in consultation with appropriate SWGs and DWGs)

* Evaluation of results of cross agency/system data exchange

## Deliverables

All deliverables for the project will be in the form of OGC engineering reports, content hosted on a public OGC GitHub project, and recorded demonstrations of running systems.

### Documentation

An engineering report will summarize the overall IE and the group’s findings. The IE will be managed using GitHub issues, wiki, pages, and general code repository functionality. It is the intention of the IE Initiators that all project artifacts be made public through this repository upon IE conclusion.

### Demonstration

Demonstration that can be made available as static content will be made available as public web content hosted using GitHub public hosting capabilities. While embedded links in encoded documents may not persist, the data visualizations and other content for demonstration purposes will be rendered into static html, recorded for later reference, and/or checked into the project repository for later user.

## Proposed Schedule

**Startup**

Late December 2019 - Activity Plan Submission

February 2019 - Anticipated OGC Architecture Board Approval

**Execution**

March 2019 - Kickoff workshop after 30-day participant notification period

June 2019 - Focused development workshops. Finalize IE engineering phase.

September 2019 - Finalize demonstration systems and materials.

December 2019 - Demonstrate IE at TC and Deliver Engineering Report

## Resource Plan

The initiative manager will be David Blodgett with support from Jim Kreft (USGS) and the Initiative Technical Lead will be Alistair Ritchie with support from David Medyckyj-Scott (Manaaki Whenua). 

Sylvain Grellet and Abdel Feliachi will take part from from the French BRGM. 

Boyan Brodaric, Eric Boisvert and Heryk Julien will take part from Natural Resources Canada.

The following resources will be available:

<table>
  <tr>
    <td>Staffing</td>
    <td>Each initiating and participating organization will provide adequate staff resources to support their defined responsibilities for the duration of the IE. </td>
  </tr>
  <tr>
    <td>Hardware</td>
    <td>Initiating organizations will provide hardware as needed to support the IE. Resources associated with the OGC github organization are requested to house the IE’s work</td>
  </tr>
  <tr>
    <td>Software</td>
    <td>Initiating organizations will provide software as needed to support the IE. Resources associated with the OGC github organization are requested to house the IE’s work.</td>
  </tr>
  <tr>
    <td>Other Resources</td>
    <td>Participants in the IE are self-funded. All expenses incurred in carrying out the IE will be assumed by the participating agencies within their regular line-of-business. </td>
  </tr>
</table>


