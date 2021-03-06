spark-submit \
--jars hdfs://localhost:54310/user/hduser/oozie/5sqoophivelastval/mysql-connector-java.jar \
--class org.inceptez.simpleapp.customer \
--master yarn \
--deploy-mode cluster \
hdfs://localhost:54310/user/hduser/oozie/5sqoophivelastval/sparkwork.jar \
hdfs://localhost:54310/user/hduser/oozie/5sqoophivelastval/cust \
/home/hduser/install/oozie_updated/oozieusecases/5sqoophivelastval/connection.prop \
--queue default \
--driver-memory 512m \
--num-executors 1 \
--executor-cores 2 \
--executor-memory 512m \
--spark-shuffle-compress true \
--spark-speculation true \
--spark-dynamicAllocation-enabled true \
--spark-dynamicAllocation-initialExecutors 1 \
--spark-dynamicAllocation-minExecutors 1 \
--spark-dynamicAllocation-maxExecutors 8 \
--spark-dynamicAllocation-executorIdleTimeout 30s \
--conf spark.shuffle.service.enabled true \
--conf spark.sql.shuffle.partitions=4;
