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
dvc run -d src -n write --plots metrics/plots-cls.csv "cp $main/plots.csv metrics/plots-cls.csv"
dvc plots modify metrics/plots-cls.csv -x epoch --x-label Epoch
dvc plots show metrics/plots-cls.csv
