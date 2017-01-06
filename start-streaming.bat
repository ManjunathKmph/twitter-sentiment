::Script to start the spark streaming to fetch tweets from twitter.

::Set the kafka bin path to PATH variable.
set KAFKA_HOME=G:\\kafka_2.11-0.10.0.1\\kafka_2.11-0.10.0.1
set PATH=%PATH%;%KAFKA_HOME%\\bin;

::Command to create the project related kafka topics.
kafka-topics.bat --create --topic twitterTopic --zookeeper localhost:2181 --replication-factor 1 --partitions 1
kafka-topics.bat --create --topic sentimentTopic --zookeeper localhost:2181 --replication-factor 1 --partitions 1

::command to build the twitter streaming jar file.
call sbt assembly

::command to submit the jar file to spark to start the twitter streaming.
set SPARK_HOME=G:\\spark-2.0.2-bin-hadoop2.7\\spark-2.0.2-bin-hadoop2.7
set PATH=%PATH%;%SPARK_HOME%\\bin;

spark-submit --class com.manju.twitter.TwitterStreaming --jars jars/stanford-corenlp-3.6.0-models.jar,jars/stanford-corenlp-3.6.0.jar,jars/ejml-0.23.jar target/twitterstreamingproject-assembly-1.0.jar