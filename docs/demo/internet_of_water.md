# US Internet of Water Distributed Data and Observations

## Use Case Description

<!--
this is talking about a “domain” use case (SELFIE is the technical use-case — 🤪)
-->

The Internet of Water (IoW) is an initiative [proposed by a multi-stakeholder workshop](https://www.aspeninstitute.org/tag/internet-of-water/) that has been supported by a foundation and has a [non-profit organization](https://internetofwater.org/about/) by the same name working toward the initiative's goals. The initiative proposes a federated system of data providers and consumers that are aggregated into domain-specific "hub" organizations and coordinated by a single "umbrella" organization. Data producers are to maintain ownership and control of their information and federation is intended to be cache-only in that information ownership should never be transferred if the data producer wants to maintain ownership. 

This use case applies to all types of water data--hydrography, hydrometric observations, hydrologic model results, water quality, hydrodynamics, etc. Ultimately, the hub and umbrella model requires construction of a linked-data system that references common environmental features throughout. Data providers' services should use consistent methods to reference those features to facilite automated discovery of newly available or changed data.

[**See this github repository for more.**](https://github.com/internetofwater/geoconnex.us)  
[**See the demo resources here for initial SELFIE content in this use case.**](https://github.com/opengeospatial/SELFIE/tree/master/docs/usgs)
[**Use this JSON-LD demo page as an entry-point.**](https://geoconnex.us/SELFIE/usgs/huc/huc12obs/070900020601)

### User Story

<!--
Who is this person we call user? Help make them real.
-->

As a user of water data, I need to discover and access water information relevant to the environmental feature I care about from all the organizations that hold data about it, so I don't have to have special knowledge to access some information and so I don't miss some potentially relevant information.

### Datasets and Sources

<!---
Use this section to document your data and the distributed network of data providers.
Alude to the non information resource and information content that satisfies the use
case. Discussion of how the unique use case uses the SELFIE "core" concepts should be
included here.
--->

- USGS Reference Hydrography
- State and local data and observations
- University consortia aggregated data services
- Federal aggregated data and services

In the long run, this demonstration should have a very broad scope. Initially, it will focus on building a catalog of hydrographic and observed data associated with hydrologic units. 

## Demo Description and Links

For this demonstration, the primary entry point is a [single hydrologic unit](https://geoconnex.us/SELFIE/usgs/huc/huc12obs/070900020601) with three realizations: 1) a [hydrographic network](https://geoconnex.us/SELFIE/usgs/nhdplusflowline/huc12obs/070900020601) of flowlines, 2) a [catchment divide](https://geoconnex.us/SELFIE/usgs/hucboundary/huc12obs/070900020601) containing a polygon representation, and 3) a [hydrometric network](https://geoconnex.us/SELFIE/usgs/hydrometricnetwork/huc12obs/070900020601) index of monitoring data.

These three realizations can be seen in the example below:
```json
{
 "@context": [
  "https://opengeospatial.github.io/ELFIE/contexts/elfie-2/elf-index.jsonld",
  "https://opengeospatial.github.io/ELFIE/contexts/elfie-2/hy_features.jsonld"
 ],
 "@id": "https://geoconnex.us/SELFIE/usgs/huc/huc12obs/070900020601",
 "@type": "https://www.opengis.net/def/appschema/hy_features/hyf/HY_Catchment",
 "name": "Waunakee Marsh-Sixmile Creek",
 "description": "USGS Watershed Boundary Dataset Twelve Digit Hydrologic Unit Code Watershed",
 "catchmentRealization": [
  {
   "@id": "https://geoconnex.us/SELFIE/usgs/nhdplusflowline/huc12obs/070900020601",
   "@type": "https://www.opengis.net/def/appschema/hy_features/hyf/HY_HydrographicNetwork"
  },
  {
   "@id": "https://geoconnex.us/SELFIE/usgs/hucboundary/huc12obs/070900020601",
   "@type": "https://www.opengis.net/def/appschema/hy_features/hyf/HY_CatchmentDivide"
  },
  {
   "@id": "https://geoconnex.us/SELFIE/usgs/hydrometricnetwork/huc12obs/070900020601",
   "@type": "https://www.opengis.net/def/appschema/hy_features/hyf/HY_HydrometricNetwork"
  }
 ]
}
```

<!--
Also add one or more screenshots or other graphics with a descriptive caption for each.  
Add screenshots to https://github.com/opengeospatial/ELFIE/tree/master/docs/images 
so they show up at a path like: `https://opengeospatial.github.io/ELFIE/images/ELFIE_logo.png`  
-->

![alt text -- SELFIE Logo](https://opengeospatial.github.io/ELFIE/images/SELFIE_logo.png)

### Links to Demo Resources

The demo was created using the R code found here: https://github.com/opengeospatial/SELFIE/tree/master/tools/R  

While it will expand into other systems, the following resources have been contributed directly to the SELFIE space.

The top level Hydrologic Unit "HY\_Catchment":
https://geoconnex.us/SELFIE/usgs/huc/huc12obs/070900020601

The flowlines "HY\_HydrographicNetwork":
https://geoconnex.us/SELFIE/usgs/nhdplusflowline/huc12obs/070900020601

The boundary "HY\_CatchmentDivide":
https://geoconnex.us/SELFIE/usgs/hucboundary/huc12obs/070900020601

The monitoring sites "HY\_HydrometricNetwork":
https://geoconnex.us/SELFIE/usgs/hydrometricnetwork/huc12obs/070900020601

flowlines and boundary are intended to provide a visual representation and could also be used for geoprocessing workflows. Monitoring sites are a potentially long list of well-documented monitoring for the hydrologic unit. The state of "well-documented" in this use case is be a work in progress.

## Demo findings and potential next steps

### TODO

Discuss issues that this demo works around or would otherwise need to be solved to take
it from demonstration/experiment to production. Talk about how the SELFIE core of 303
redirection and use of JSON-LD in HTML landing pages works in the context of the complete
technical setting of your use case. Discussion of what future experimentation is needed
should go here.
