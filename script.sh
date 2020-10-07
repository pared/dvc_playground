#!/bin/bash

main=$(pwd)
rm -rf workspace
mkdir workspace
pushd workspace

mkdir repo
pushd repo

git init --quiet
dvc init --quiet

echo "src" >> src
dvc add src

mkdir metrics
dvc run -d src -n write --plots metrics/plots.csv "cp $main/plots.csv metrics/plots.csv"
dvc plots modify metrics/plots.csv -x epoch --x-label Epoch
dvc plots show metrics/plots.csv
