# Second Environmental Linked Features Interoperability Experiment

The initial Environmental Linked Features Interoperability Experiment sought sustainable and automatable solutions to link multi-disciplinary, multi-organization environmental data without the requirement to transfer custody or burden of maintenance of data. It built on W3C best practices, providing guidance and a common approach for encoding environmental feature data and links between and among features and observational data about them. Using these technologies, it bridged the divide between the great flexibility and power of OGC services and the more focused and specific technologies that drive modern web development. 

Building on the content-focused outcomes of the first ELFIE, the Second ELFIE (SELFIE) is designing and vetting Web-resource model and network behavior for cross-domain linked feature data that compliments and uses WFS3 as a building block. This aims to answer the question, how do we use linked data in a way that's compatible with W3C best practices and leverages OGC standards? The experiment aims for focused simplicity, representing resources built from potentially complex data for easy use on the Web. While the IE will test a specific resource model and will follow W3C best practices and OGC standards, a wide range of participant-provided domain-use cases will be used for testing. Ultimately, this work is intended to satisfy the needs of many use cases and many kinds of features, from disaster response and resilience to environmental health and the built environment.

## How to get involved

1. [Sign the observer agreement](https://portal.opengeospatial.org/files/?artifact_id=82492)  
1. [Attend telecons](https://calendar.google.com/event?action=TEMPLATE&tmeid=XzhsMmplZDlwNmQxNDRiOWo3NTBqMmI5azY0cWo2YmEyOGNyMzJiYTE4b3MzNGRpNThjcmo4ZDFoOGNfMjAxOTA1MjFUMjAwMDAwWiBkYmxvZGdldHRAdXNncy5nb3Y&tmsrc=dblodgett%40usgs.gov&scp=ALL) 
1. [Watch this repository](https://help.github.com/en/articles/watching-and-unwatching-repositories) 
1. [Take part in discussions in the issues.](https://github.com/opengeospatial/SELFIE/issues) 

As SELFIE progresses, there will be opportunities to implement experimental contributions using data and use cases important to you and your stakeholders.

## Repository plan

This repository will be used to house sample data as well as SELFIE web resources. As was the case in the first [ELFIE](https://opengeospatial.github.io/ELFIE/), many IE outcomes will be static web resources that will be available as long as the opengeospatial.github.io hosting is available.

### `data/`
All example data (that can be checked in) that used or referred to in the SELFIE project, will be housed in the `data/` folder. The aim is for SELFIE examples and demonstrations to be based on reproducible code and small sample datasets. Some examples will require running web-servers and/or notebooks.

### `docs/`
The [https://opengeospatial.github.io/SELFIE/](https://opengeospatial.github.io/SELFIE/) resouces are housed in the `docs/` folder.

### `er/`
The Engineering Report will be drafted in AsciiDoc within the `er/` folder.

### `tools/`
All software tools will be housed in the `tools/` folder. Jupyter notebook source files, docker containers, javascript apps, etc. will all be housed here as a record of work done for SELFIE.

## Contributing

All contributions should be made through the fork/pull request workflow common to open source github projects. There are many tutorials on the workflow and the basic tools needed for it. To make a contribution, 

1. Fork this repository
1. Clone your fork to a local repository
1. Add this repository as upstream
1. Make changes -- commit them
1. Push changes to your personal fork
1. Open a pull request
1. Get review
1. Address review
1. Pull request gets merged by someone with privileges
1. Pull changes from upstream to your local repository

Feel free to ask questions in the issues if you need help.

