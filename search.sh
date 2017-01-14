
for lib in $(find . -name \*.a) ;
do
	echo "#### $lib ####"
	echo $lib ; nm $lib | grep pjsip_msg_find_hdr; # | grep -v " U "   ;
done
