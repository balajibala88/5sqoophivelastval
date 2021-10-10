package org.inceptez.simpleapp

import org.apache.spark._
import org.apache.spark.sql._
import java.sql.Connection
import java.util.Properties
import java.io.FileInputStream

object customer {

  def main(args:Array[String])
  {
  val spark = SparkSession.builder().appName("customer check program").getOrCreate();
  val df1 = spark.read.option("inferSchema", true).option("header",true).csv(args(0));
  df1.show(10,false)
  
  val conn = new java.util.Properties();
  val connPropFile = new java.io.FileInputStream(args(1));
  conn.load(connPropFile)
  
  val Driver = conn.getProperty("driver")
  val Host = conn.getProperty("host")
  val Port = conn.getProperty("port")
  val User = conn.getProperty("user")
  val Pass = conn.getProperty("pass")
  
  val propLoad = new java.util.Properties();
  propLoad.put("user", s"$User")
  propLoad.put("password",s"$Pass")
  propLoad.put("driver", "com.mysql.jdbc.Driver")
  
  df1.write.mode("overWrite").jdbc("jdbc:mysql://localhost/custdb", "customeroozie", propLoad)
  
  }

}