#!/bin/sh

if [ -z "$JAVA_HOME" ] ; then
  echo "Error: JAVA_HOME is not defined."
  exit 1
fi

"$JAVA_HOME/bin/java" -Dfile.encoding="UTF-8" -cp "./../lib/druid-1.0.0.jar:$JAVA_HOME/lib/tools.jar" com.alibaba.druid.support.console.DruidStat  $@
