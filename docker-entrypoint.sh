#!/bin/bash
file=$1
config_folder_destination=$2
config_folder_source=$3
echo "copy config start"
echo "source $config_folder_source, destination $config_folder_destination"
cp -Lvr $config_folder_source/. /app/Config
echo "copy config finish"
dotnet $file