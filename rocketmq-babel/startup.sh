#!/bin/sh
#JAVA_HOME="/usr/java/jdk1.6.0_31"
APP_LOG=logs
if [ ! -d "$APP_LOG" ]; then
  mkdir $APP_LOG
fi
JAVA_OPTS="-Duser.timezone=GMT+8 -server -Xms512m -Xmx512m -Xloggc:logs/gc.log -Denable_ssl=true -Drocketmq.namesrv.domain=172.30.50.54 "
APP_MAIN=com.ndpmedia.rocketmq.babel.$1
CLASSPATH=target/classes
echo $CLASSPATH
LIB_JARS=""
libdir=`ls target/lib`
i=0
for file in $libdir
do
    if [ i == 0 ]; then LIB_JARS="target/lib/"$file; else LIB_JARS="target/lib/"$file":$LIB_JARS"; fi;i=$(($i+1))
done
echo $LIB_JARS
JAVA_HOME=$JAVA_HOME
if [ ! -d "$JAVA_HOME" ]; then JAVA_HOME="/usr"; else echo "$JAVA_HOME"; fi;
nohup $JAVA_HOME/bin/java $JAVA_OPTS -Dworkdir=./  -classpath target/classes:$LIB_JARS $APP_MAIN > $APP_LOG/$1.nohup.log &