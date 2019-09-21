#!/usr/bin/env bash

RUN_DIR=/var/vcap/sys/run/scala
LOG_DIR=/var/vcap/sys/log/scala
PIDFILE=$RUN_DIR/scala.pid

case $1 in

  start)
    mkdir -p $RUN_DIR
    mkdir -p $LOG_DIR

    echo $$ > $PIDFILE
    exec /var/vcap/packages/scala/usr/share/scala/bin/scalac /var/vcap/packages/scala/ScalaExample.scala >>$LOG_DIR/scala.stdout.log 2>>$LOG_DIR/scala.stderr.log
    #exec /var/vcap/packages/scala/usr/bin/scala ScalaExample >>$LOG_DIR/scala.stdout.log 2>>$LOG_DIR/scala.stderr.log
    ;;

  stop)
    PID=$(head -1 $PIDFILE)
    kill $PID
    while [ -e /proc/$PID ]; do sleep 0.1; done
    rm -f $PIDFILE
    ;;

  *)
  echo "Usage: ctl {start|stop}" ;;
esac
exit 0
