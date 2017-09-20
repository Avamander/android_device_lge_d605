#!/bin/bash

VENDOR=lge
DEVICE=d605

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi



for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi

    if [ "$SRC" = "adb" ]; then
        # Try CM target first
        adb pull /system/$FILE $BASE/$FILE
        # if file does not exist try OEM target
        if [ "$?" != "0" ]; then
            adb pull /system/$FILE $BASE/$FILE
        fi
    else
        cp /media/data/d605/images/system/$FILE $BASE/$FILE
        # if file dot not exist try destination
        if [ "$?" != "0" ]
            then
            cp /media/data/d605/images/system/$FILE $BASE/$FILE
        fi
    fi
done

./setup-makefiles.sh
