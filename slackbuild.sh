#!/bin/bash

topdir=$(pwd)
for gz in *.tar.gz
    do
        tar xf $gz 
        pname=${gz/.tar.gz}
        echo $pname
        cd $pname || {echo "Extracting $gz failed" && break}
        cat ${pname}.info
        . ${pname}.info

        wget $DOWNLOAD_x86_64 || wget $DOWNLOAD || {echo "Fetch source failed for $pname" && break}

        ./${pname}.SlackBuild && mv /tmp/${pname}-*.tgz $topdir
        
        # Restore env
        unset DOWNLOAD DOWNLOAD_x86_64
        cd $topdir 
    done

