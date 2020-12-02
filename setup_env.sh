#!/bin/bash

# Date        : Sun Nov  8 19:50:25 CET 2020
# Autor       : Leonid Burmistrov, Andrii Kleshchonok
# Description : 

# Libraries to be added
function install_packages_sh {
    echo "install_packages_sh"
    # pandas-profiling
    #conda search -c conda-forge pandas-profiling=2.9.0
    #echo "installing --> pandas-profiling=2.9.0"
    #conda install -y -c conda-forge pandas-profiling=2.9.0
    # scikit-learn
    #conda search scikit-learn=0.23.2
    #echo "installing --> scikit-learn==0.23.2"
    #conda install -y scikit-learn=0.23.2
}

function create_sh {
    conda create --name $evnName -y numpy pandas notebook matplotlib
    conda env list
    echo " "
    echo "> conda activate $evnName"
}

function clean_sh {
    rm -rf *~
    rm -rf */*~
    rm -rf \#*
    rm -rf .#*
    rm -rf .ipynb_checkpoints
    rm -rf ./compressed_sensing/\#*
    rm -rf ./compressed_sensing/.#*
    rm -rf ./compressed_sensing/.ipynb_checkpoints
    rm -rf ./sisso/\#*
    rm -rf ./sisso/.#*
    rm -rf ./sisso/.ipynb_checkpoints
}

function zipTheFile {
    zip -r $1'.zip' $1
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -c       : clean "
    echo " -h       : print help "
    echo " -conda   : create environment "
    echo " -install : install packages "
    echo " -zip     : zip the file "
    echo "    [1]   : file to zip "
    echo " "
    echo " INFO     : To setup conda environment --> conda activate neuro"
    echo " INFO     : To install --> conda install pandas-profiling=2.9.0"
    echo " INFO     : To list all the packages available --> conda search"
    echo " INFO     : To install from https://conda-forge.org/ --> conda install -c conda-forge pandas-profiling=2.9.0"
    echo " INFO     : To list all the packages available in https://conda-forge.org/ --> conda search -c conda-forge"
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
    elif [ "$1" = "-install" ]; then
	install_packages_sh
    elif [ "$1" = "-zip" ]; then
	if [ $# -eq 2 ]; then
	    zipTheFile $2
	fi
    else
        printHelp
    fi
fi
