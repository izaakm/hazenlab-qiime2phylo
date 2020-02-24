#!/usr/bin/env bash

################################################################################
# Usage
################################################################################
# Make sure your in the project root directory (not a subdirectory), e.g.,:
#   $ cd ~/qiime2phylo
# Create a directory in which to download the data:
#   $ mkdir data
# Set the environment variable:
#   $ export DATADIR="${PWD}/data"
# Run this script to download the required data:
#   $ bash src/data/make_data.sh
################################################################################

# DATADIR="test/data"

# If DATADIR is not set, warn the user and exit.
if [[ -z $DATADIR ]]; then
    echo "The DATADIR variable is not set."
    echo "Exiting ..."
    exit 1
else
    echo "Downloading data into $DATADIR ... "
    sleep 1
fi

# Variables

# https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/aligned-rep-seqs.qza
# https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/masked-aligned-rep-seqs.qza
# https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/rep-seqs.qza
# https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/rooted-tree.qza
# https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/table.qza
# https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/taxonomy.qza
# https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/unrooted-tree.qza
URLS=("https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/table.qza"
      "https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/taxonomy.qza"
      "https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/rooted-tree.qza"
      "https://docs.qiime2.org/2019.10/data/tutorials/moving-pictures/rep-seqs.qza"
     )


# Functions

function download() {
    URL=$1
    DEST=$2

    mkdir -pv $(dirname "$DEST")

    wget -O "$DEST" "$URL"
}


# Main

_find="https://docs.qiime2.org/2019.10/data"
_replace="$DATADIR"

for url in ${URLS[*]} ; do
    DEST="${url/$_find/$_replace}"
    download "$url" "$DEST"
done

    
exit 0
