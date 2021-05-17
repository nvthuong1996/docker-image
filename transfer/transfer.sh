#!/bin/bash

echo "create folder: $2"
mkdir -p $2


if [ -z "$(ls -A $2)" ]; then
    IFS=':'
    read -a strarr <<< "$1"

    sshTarget="${strarr[0]}"

    sshPath="${strarr[1]}"

    echo $sshTarget

    echo $sshPath

    dateMilisecond=$(date +%s%N)

    tmpFile="/tmp/$dateMilisecond.tar.gz"

    echo "=================================="
    echo "compress path: $sshPath"
    echo "=================================="

    echo "tmp file: $tmpFile"
    echo "=================================="

    ssh -o StrictHostKeyChecking=no $sshTarget "cd $sshPath && tar -zcvf $tmpFile ."

    scp -o StrictHostKeyChecking=no "$sshTarget:$tmpFile" "$tmpFile"

    echo "=================================="

    tar -xvf $tmpFile -C $2

    chown -R 1001:1001 $2

    echo "=================  DONE =================="
else
    echo "folder $2 has content"
fi



