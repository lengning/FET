# FET
Fisher's exact test wrapper
Codes to perform fisher's exact test. Example to run the code (from command line):

Rscript FET.R Allgenes.txt geneList.txt geneIdentified.txt FET_out.txt


The inputs for the code are:

- [FileNameIn1] Input file contains names of all genes. Each gene in one row
- [FileNameIn2] Input file contains names of the marker list of interest. Each gene in one row
- [FileNameIn3] Input file contains names of the identified genes. Each gene in one row
- [FileNameOut] Output file name. The output file contains two numbers - fisher's exact test p value and log p value.

The contigency table, test statatistics and confidence intervals will be shown in console.
