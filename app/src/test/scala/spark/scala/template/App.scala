package com.example

import org.scalatest.funsuite.AnyFunSuite
import org.apache.spark.sql.SparkSession

class SparkSessionTest extends AnyFunSuite {

  val spark: SparkSession = {
    SparkSession.builder()
      .appName("SparkSessionTest")
      .master("local")
      .getOrCreate()
  }
  assert(spark != null)
  spark.stop()

}