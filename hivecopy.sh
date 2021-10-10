if [ $# -ne 2 ]
then
echo "no arguements present"
exit 2
else
echo "argument passed are $1, $2"
fi


SQOOPPATH=$1
HIVEPATH=$2

#if [-d ${HIVEPATH} ]
#then
hadoop fs -rm -r ${HIVEPATH}
echo "deleted ${HIVEPATH}"
#fi

if [ $? -eq 0 ]
then
hadoop fs -cp -f ${SQOOPPATH} ${HIVEPATH}
fi

if [ $? -eq 0 ]
then
echo "file copied successfully"
else
echo "unsuccessful copy"
fi


