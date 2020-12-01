#!/bin/bash

# Date        : Sun Nov  8 19:50:25 CET 2020
# Autor       : Leonid Burmistrov, Andrii Kleshchonok
# Description : 

# Libraries to be added
# conda install -c conda-forge pandas-profiling=2.9.0
# conda install -y scikit-learn

function create_sh {
    conda create --name $evnName -y numpy pandas notebook
    conda env list
    echo " "
    echo "> conda activate $evnName"
    #conda list | grep numpy
    #conda list | grep pandas
    #conda list | grep notebook
}

function clean_sh {
    rm -rf *~
    rm -rf */*~
    rm -rf \#*
    rm -rf .#*
}

function zipTheFile {
    zip -r $1'.zip' $1
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -c     : clean "
    echo " -h     : print help "
    echo " -conda : create environment "
    echo " -zip   : zip the file "
    echo "    [1] : file to zip "
    echo " "
    echo " INFO   : To setup conda environment --> conda activate neuro"
    echo " INFO   : To install --> conda install pandas-profiling=2.9.0"
    echo " INFO   : To list all the packages available --> conda search"
    echo " INFO   : To install from https://conda-forge.org/ --> conda install -c conda-forge pandas-profiling=2.9.0"
    echo " INFO   : To list all the packages available in https://conda-forge.org/ --> conda search -c conda-forge"
}

evnName='neuro'

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-c" ]; then
            clean_sh
    elif [ "$1" = "-h" ]; then
	printHelp
    elif [ "$1" = "-conda" ]; then
	create_sh
    elif [ "$1" = "-zip" ]; then
	if [ $# -eq 2 ]; then
	    zipTheFile $2
	fi
    else
        printHelp
    fi
fi
