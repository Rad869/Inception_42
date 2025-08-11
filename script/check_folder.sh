#!/bin/bash

if [ ! -d ${HOME}/data/db -o ! -d ${HOME}/data/wp  ]; then
    mkdir -p ${HOME}/data/db
    mkdir -p ${HOME}/data/wp
fi