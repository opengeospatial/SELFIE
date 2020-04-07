# JSON-LD Example Files

## Summary
Example instance documents for [SELFIE JSON-LD Contexts](https://opengeospatial.github.io/ELFIE/contexts/elfie-2/).

Note that these example documents contain URIs on experimental servers. While they resolved at the time of the SELFIE IE they may not be maintained beyond the end of the experiment.

## Example Files

| Example FILE | Name | Comment | 
| ------------ | ------- | ------- | 
| [landing-resource.jsonld](https://opengeospatial.github.io/SELFIE/examples/landing-resource.jsonld) | Meta information resource. | Linked-feature documents for difference features: [[1](https://opengeospatial.github.io/SELFIE/examples/landing-resource-1.jsonld), [2](https://opengeospatial.github.io/SELFIE/examples/landing-resource-2.jsonld)] |
| [landing-resource.geojson](https://opengeospatial.github.io/SELFIE/examples/landing-resource.geojson) | GeoJSON meta information resource. | An attempt (see GeoJSON-LD Notes below) at a [GeoJSON-LD](https://geojson.org/geojson-ld/) meta resource document. Essentially a GeoJSON feature with a JSON-LD meta resource document included as the ```"properties"``` object. Multiple documents for difference features: [[1](https://opengeospatial.github.io/SELFIE/examples/landing-resource-1.geojson), [2](https://opengeospatial.github.io/SELFIE/examples/landing-resource-2.geojson), [3](https://opengeospatial.github.io/SELFIE/examples/landing-resource-3.geojson)] |
| api-[meta](https://opengeospatial.github.io/SELFIE/examples/api-landing-resource.geojson)-resource.geojson | OGC API - Features GeoJSON meta/data information resource. | **Experimental** A GeoJSON-LD document massaged to be the data source for a Collection in an OGC API - Features service. These combine all the meta or data resource documents into a single GeoJSON ```FeatureCollection``` and add some API required properties (e.g. ```"fid"```). |
| [CeRDI\_Borehole\_MetaResource.jsonld](https://opengeospatial.github.io/SELFIE/examples/CeRDI_Borehole_MetaResource.jsonld) | Name-here | Description-here |
| [CeRDI\_Borehole\_DataResource.jsonld](https://opengeospatial.github.io/SELFIE/examples/CeRDI_Borehole_DataResource.jsonld) | Name-here | Description-here |
[CeRDI_DataResource_GW_Well_917937.xml](https://opengeospatial.github.io/SELFIE/examples/CeRDI_DataResource_GW_Well_917937.xml) | Name-here | Description-here |
[Observation.jsonld](https://opengeospatial.github.io/SELFIE/examples/Observation.jsonld) | Name-here | Description-here |
[ObservationCollection.jsonld](https://opengeospatial.github.io/SELFIE/examples/ObservationCollection.jsonld) | Name-here | Description-here |
[Observation_KS.jsonld](https://opengeospatial.github.io/SELFIE/examples/Observation_KS.jsonld) | Name-here | Description-here |
[aquifer121AS01_BRGM_JSONLD.json](https://opengeospatial.github.io/SELFIE/examples/fr/aquifer121AS01_BRGM_JSONLD.json) | Name-here | Description-here |

## GeoJSON-LD Notes
These example documents include GeoJSON docs testing the legality of GeoJSON-LD in the context of JSON-LD 1.1 - the
assumption being that the nested arrays used by GeoJSON geometries could be handled by a JSON-LD 1.1 parser. The
documents are the equivalent JSON-LD document wrapped in the ```"properties"``` object in the GeoJSON Feature. E.g.
[landing-resource.geojson](https://opengeospatial.github.io/SELFIE/examples/landing-resource.geojson) contains
[landing-resource.jsonld](https://opengeospatial.github.io/SELFIE/examples/landing-resource.jsonld).

Testing with the [JSON-LD Playground](https://json-ld.org/playground/) suggests GeoJSON-LD still isn't legal. Point
geometries could be converted to RDF, but polygons could not.

The idea that a GeoJSON (no -LD) document is a useful transport wrapper for a JSON-LD object still stands - i.e. we can
get the content into a browser using GeoJSON and then extract the JSON-LD ```"properties"``` object as work with it as
RDF document.