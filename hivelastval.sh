if [ $# -ne 1 ]
then
echo "no arguements present"
exit 2
else
echo "argument passed is $1"
fi

#lastval=$(echo "`hive -S -e "select from_unixtime(unix_timestamp(max(upddt),'yyyy-MM-dd HH:mm:ss') + (+1)) from $1"`")
lastval=$(echo "`hive -S -e "select max(upddt) from $1"`")

if [ $lastval = NULL ]
then
lastval=$(echo 0)
fi
echo "lastval=$lastval"

