# Intellectual Property Rights
The content of this document is copyrighted by the Open Geospatial Consortium (OGC) and may be [licensed](https://github.com/opengeospatial/er_template/blob/master/LICENSE) for designated purposes.

> NOTE: The language below should already be included in the `1-summary.adoc` source file. It is replicated here for convenience.

Attention is drawn to the possibility that some of the elements of this document may be the subject of patent rights. The Open Geospatial Consortium shall not be held responsible for identifying any or all such patent rights.

Recipients of this document are requested to submit, with their comments, notification of any relevant patent claims or other intellectual property rights of which they may be aware that might be infringed by any implementation of the standard set forth in this document, and to provide supporting documentation.

# Overview
This is a template proposed for testbed Engineering Reports. The objective is for editors to check this out (Clone a version) and begin editing it with a tool such as e.g. Atom editor and Asciidoctor conversion tool. There are detailed instructions, installation info, and syntax recommendations in the template _.adoc_ files.

Note that the files index.adoc, 0-preface.adoc, asciidoctor.css, and all files in folder _resources_ should not be modified. Please begin with file er.adoc. The file er.adoc has instructions in the form of comment. These don't need to be removed. Other files have helper texts that provide instructions.

It is very important that the names of the file er.adoc will not be changed, as the scripts to mass-convert all ERs fail! Ideally, you only name

* er.adoc
  * preface.adoc (don't change this)
  * 1-summary.adoc
  * 2-references.adoc
  * 3-terms.adoc
  * 4-overview.adoc
  * 5-example.adoc (some asciidoc syntax help. Use as many copies as you need sections in your document)

  * annex-a.adoc  --|
  * annex-b.adoc    |-- Use as needed
  * annex-c.adoc  --|

  * annex-history.adoc
  * annex-bibliography.adoc

# How to compile your raw files
Command for PDF output:
asciidoctor-pdf -a pdf-stylesdir=resources -a pdf-style=ogc -a pdf-fontsdir=resources/fonts -r asciidoctor-bibtex er.adoc

Command for HTML output:
asciidoctor -a stylesheet=rocket-panda.css -a stylesdir=./resources/stylesheets -r asciidoctor-bibtex er.adoc

=============
This [User Guide](http://www.methods.co.nz/asciidoc/userguide.html) might provide additional help to authors.
