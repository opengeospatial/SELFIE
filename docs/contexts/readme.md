# JSON-LD Context Files

## Summary
This document summarizes normative [JSON-LD Context
Files](https://www.w3.org/TR/json-ld/#the-context) to be referenced by
JSON-LD encoded representations of resources provided by SELFIE participants.
Some contexts are new, others are modifications of contexts defined for 
[ELFIE](https://github.com/opengeospatial/ELFIE)

## Contexts

| CONTEXT FILE | EXAMPLE | COMMENT | 
| ------------ | ------- | ------- | 
| [elf-index.jsonld](https://opengeospatial.github.io/SELFIE/contexts/elf-index.jsonld) |  | Core properties of each feature that support discovery, indexing and presentation of basic summary information. Each domain specific JSON (any type of resource) file should include these. Modified version of [ELFIE/elf.jsonld](https://opengeospatial.github.io/ELFIE/json-ld/elf.jsonld).  |
| [elf-data.jsonld](https://opengeospatial.github.io/SELFIE/contexts/elf-data.jsonld) |  | Properties of an object that wraps representations of a real world ('non-information') resource.  |
| [gw.jsonld](https://opengeospatial.github.io/SELFIE/contexts/gw.jsonld) |  | Extended version of [ELFIE/gw.jsonld](https://opengeospatial.github.io/ELFIE/json-ld/elf.jsonld).  |