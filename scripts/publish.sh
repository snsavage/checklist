#!/bin/bash

publish_path="/c/Program\ Files\ \(x86\)/Jenkins/workspace/Checklist-Scott-Savage-Releases-Working/releases"

echo "Preparing Application for Publication"

echo "verifying publish path"
if [ ! -d "$publish_path" ] ; then
    echo "publish path $publish_path could not be found"
    exit 1
fi

echo "cd to dotnet path"
if ! cd ../dotnet ; then
    echo "cd could not move to dotnet path"
    exit 1
fi

echo "dotnet clean"
if ! dotnet clean ; then 
    echo "dotnet clean could not be completed"
    exit 1
fi

echo "dotnet restore"
if ! dotnet restore ; then
    echo "dotnet restore could not be completed"
    exit 1
fi

echo "dotnet build"
if ! dotnet build ; then
    echo "dotnet build could not be completed"
    exit 1
fi

echo "dotnet publish"
if ! dotnet publish --output "$publish_path" ; then
    echo "dotnet publish could not be completed"
    exit 1
fi

echo "Publish complete!"

exit 0

