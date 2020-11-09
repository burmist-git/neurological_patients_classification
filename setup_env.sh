#!/bin/bash

# Date        : Sun Nov  8 19:50:25 CET 2020
# Autor       : Leonid Burmistrov
# Description : 

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
    rm -rf *~ build dist trainingpython.egg-info __pycache__ .ipynb_checkpoints
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -c     : clean "
    echo " -h     : print help "
    echo " -conda : create environment "
    echo " INFO   : To conda env --> conda activate neuro"
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
    else
        printHelp
    fi
fi
