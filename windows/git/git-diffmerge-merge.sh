#! /bin/sh

localPath="$2"
basePath="$1"
remotePath="$3"
resultPath="$4"

if [ ! -f $basePath ]
then
    basePath="~/diffmerge-empty"
fi

"C:/Program Files/SourceGear/DiffMerge/DiffMerge.exe" --merge --result="$resultPath" "$localPath" "$basePath" "$remotePath" --title1="Current Branch" --title2="Result: $4" --title3="Other Branch"
