
cd `dirname $0`

mkdir -p proprietary/gapps

# Get gapps
GAPPS_URL=http://goo.im/gapps/gapps-ics-20120429-signed.zip
TMP_FILE=/tmp/gapps.zip
curl -L $GAPPS_URL > $TMP_FILE &&
unzip -o $TMP_FILE -d proprietary/gapps

GAPPS_MK=products/gapps_ics.mk
echo "PRODUCT_PACKAGES +=  \\" > $GAPPS_MK
for f in `ls -1 proprietary/gapps/system/app/*.apk | egrep -v 'GalleryGoogle|GoogleQuickSearchBox'`; do
	apk=`echo $f | sed 's/.*\/\([^\/]*\)\.apk/\1/'`
    echo "    $apk \\" >> $GAPPS_MK
done

echo "\nPRODUCT_COPY_FILES +=  \\" >> $GAPPS_MK
for f in `find proprietary/gapps/system -type f ! -name '*.apk' ! -name '*.so'`; do
    src=vendor/est/$f
    dest=`echo $f | sed 's/proprietary\/gapps\///'`
    echo "    $src:$dest \\" >> $GAPPS_MK
done

echo '\nifeq ($(TARGET_ARCH),arm)' >> $GAPPS_MK
echo "PRODUCT_COPY_FILES +=  \\" >> $GAPPS_MK
for f in `find proprietary/gapps/system -type f -name '*.so'`; do
    src=vendor/est/$f
    dest=`echo $f | sed 's/proprietary\/gapps\///'`
    echo "    $src:$dest \\" >> $GAPPS_MK
done
echo '\nendif' >> $GAPPS_MK

GAPPS_MK=products/gapps_optional_ics.mk
for f in `ls -1 proprietary/gapps/optional/face/app/*.apk`; do
echo "PRODUCT_PACKAGES +=  \\" > $GAPPS_MK
	apk=`echo $f | sed 's/.*\/\([^\/]*\)\.apk/\1/'`
    echo "    $apk \\" >> $GAPPS_MK
done

echo "\nPRODUCT_COPY_FILES +=  \\" >> $GAPPS_MK
for f in `find proprietary/gapps/optional/face -type f ! -name '*.apk'`; do
    src=vendor/est/$f
    dest=`echo $f | sed 's/proprietary\/gapps\/optional\/face/system/'`
    echo "    $src:$dest \\" >> $GAPPS_MK
done
