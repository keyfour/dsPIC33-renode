#!/bin/bash
mkdir -p build
msbuild dsPIC33-renode.sln /p:Configuration=Debug /p:OutputPath=build/
