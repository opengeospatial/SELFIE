# JSON-LD Example Files

## Summary
Example instance documents for [SELFIE JSON-LD Contexts](https://opengeospatial.github.io/SELFIE/contexts).

## GeoJSON-LD Notes
These example documents include GeoJSON docs testing the legality of GeoJSON-LD in the context of JSON-LD 1.1 - the
assumption being that the nested arrays used by GeoJSON geometries could be handled by a JSON-LD 1.1 parser. The
documents are the equivalent JSON-LD document wrapped in the ```"properties"``` object in the GeoJSON Feature. E.g.
[data-resource.geojson](https://opengeospatial.github.io/SELFIE/examples/data-resource.geojson) contains
[data-resource.jsonld](https://opengeospatial.github.io/SELFIE/examples/data-resource.jsonld).

Testing with the [JSON-LD Playground](https://json-ld.org/playground/) suggests GeoJSON-LD still isn't legal. Point
geometries could be converted to RDF, but polygons could not.

The idea that a GeoJSON (no -LD) document is a useful transport wrapper for a JSON-LD object still stands - i.e. we can
get the content into a browser using GeoJSON and then extract the JSON-LD ```"properties"``` object as work with it as
RDF document.


## Contexts

| CONTEXT FILE | EXAMPLE | COMMENT | 
| ------------ | ------- | ------- | 
| [meta-resource(-*).jsonld](https://opengeospatial.github.io/SELFIE/examples/meta-resource.jsonld) | Meta information resource. | Revised ```subjectOf``` content as agreed in #33. Multiple documents (distinguished by -n suffixes) for difference features. |
| [data-resource(-*).jsonld](https://opengeospatial.github.io/SELFIE/examples/data-resource.jsonld) | Data information resource. | Final decision. Multiple documents (distinguished by -n suffixes) for difference features. |
| [meta-resource(-*).geojson](https://opengeospatial.github.io/SELFIE/examples/meta-resource.geojson) | GeoJSON meta information resource. | An attempt (see GeoJSON-LD Notes above) at a [GeoJSON-LD](https://geojson.org/geojson-ld/) meta resource document. Essentially a GeoJSON feature with a JSON-LD meta resource document included as the ```"properties"``` object. Multiple documents (distinguished by -n suffixes) for difference features. |
| [data-resource(-*).geojson](https://opengeospatial.github.io/SELFIE/examples/data-resource.geojson) | GeoJSON data information resource. | An attempt (see GeoJSON-LD Notes above) at a [GeoJSON-LD](https://geojson.org/geojson-ld/) data resource document. Essentially a GeoJSON feature with a JSON-LD data resource document included as the ```"properties"``` object. Multiple documents (distinguished by -n suffixes) for difference features. |
| [api-*-resource.geojson](https://opengeospatial.github.io/SELFIE/examples/api-meta-resource.geojson) | OGC API - Features GeoJSON meta/data information resource. | A GeoJSON-LD document massaged to be the data source for a Collection in an OGC API - Features service. These combine all the meta or data resource documents into a single GeoJSON ```FeatureCollection``` and add some API required properties (e.g. ```"fid"```). |
| ~~[data-resource-option-1.jsonld](https://opengeospatial.github.io/SELFIE/examples/data-resource-option-1.jsonld)~~ | Data information resource. Option 1. | The data information resource is an identifiable thing - has a JSON-LD ```@id```/TTL ```a``` value.  This resource is referenced by a ```@id``` value. _Removed_. Agreed to go with option 2, including revisions according to issue #33. |
| ~~[data-resource-option-2.jsonld](https://opengeospatial.github.io/SELFIE/examples/data-resource-option-2.jsonld)~~ | Data information resource. Option 2. | The data information resource is just an object in the meta information - it is a blank node. This resource is referenced by a schema:url value. _Replaced by_ [data-resource.jsonld](https://opengeospatial.github.io/SELFIE/examples/data-resource.jsonld) |