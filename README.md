# qiime2phylo
a function that reads qiime2 output files into a phyloseq object

Purpose: to read qiime2 exported files into phyloseq for use with R

Step 1: use "export from qiime2" to export otu.tsv, taxonomy.tsv, and tree.nwk 
step 2: read files into R for use with qimme2phylo
step 3: run qiime2phylo function
step 4: continue analysis with phyloseq

# notrun example
# read in data (step 2)
qiime_OTU <- read.csv ("data/feature-table1.tsv", sep = "\t", header = FALSE, stringsAsFactors = FALSE)
qiime_TAX <- read.csv ("data/taxonomy.tsv", sep = "\t", header = FALSE)
qiime_tree <- read_tree("data/tree.nwk") # this requires phyloseq to be installed
mapping_file <- read.csv("data/meta_mapping.csv", row.names = 1, sep = ",")

# run qiime2phylo (step 3)
qiime2phylo <- function(qiime_OTU, qiime_TAX, qiime_tree, mapping_file)

# output: physeq object which can be imported into phyloseq (https://github.com/joey711/phyloseq).
