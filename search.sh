echo "searching for symbole [$1]"
for lib in $(find . -name \*.a) ;
do
	echo "#### $lib ####"
	echo $lib ; nm $lib | grep $1; # | grep -v " U "   ;
done
