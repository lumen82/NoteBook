#!/bin/bash
# 参数 start|stop|restart control the process
echo "I got the commond : $1"
case $1 in
    start)
        echo "starting ..."
        ;;
    stop)
        echo "stoping ..."
        ;;
    restart)
        echo "restarting ..."
        ;;
    *)
        echo "wrong commond!"
        ;;
    esac
