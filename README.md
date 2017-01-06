#Twitter Streaming Project

#Prerequisite
1. Download and Install Node.js.
2. Download and Run Apache Spark.
3. Download and Run Apache Kafka along with Apache Zookeeper.
4. Download and Install SBT.

#Clone the Project into the local machine
git clone https://github.com/ManjunathKmph/twitterstreamingproject.git

#Steps to prepare the project
1. Download the jar from the below link and copy it into twitterstreamingproject/jars folder.
  * https://drive.google.com/file/d/0B89AibnP3IZzcUhmZ2o3Q2lmM2M/view?usp=sharing
2. Open the file from the path src/main/resources/application.properties and change the values for the following key
  * twitter4j.oauth.consumerKey
  * twitter4j.oauth.consumerSecret
  * twitter4j.oauth.accessToken
  * twitter4j.oauth.accessTokenSecret
  * bootstrap.servers.config
3. Create the following kafka topics
  * kafka-topics.sh --create --topic twitterTopic --zookeeper localhost:2181 --replication-factor 1 --partitions 1
  * kafka-topics.sh --create --topic sentimentTopic --zookeeper localhost:2181 --replication-factor 1 --partitions 1
4. Change the spark home path in the following file
  * start-streaming.sh
5. Command to execute the files in the machine
  * chmod 777 start-server.sh
  * chmod 777 start-streaming.sh

#Steps to run the project
1. Open the termainal and type the following line
  * ./start-server.sh  -- To check the server is up and running successfully, in the console it will print use the url localhost:8888/web
2. Hit the http://localhost:8888/web in the browser and it show the following image.
   
