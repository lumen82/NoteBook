#!/bin/bash
function GetPID #User #Name
{
	PsUser=$1
	PsName=$2
	pid=`ps -u $PsUser|grep $PsName|grep -v grep|grep -v vi|grep -v dbx|grep -v tail|grep -v start|grep -v stop|sed -n 1p|awk '{print $1}'`
	echo $pid
}

PID=`GetPID lumen sslocal`
echo $PID

function GetMem #PID
{
	MEMUsage=`ps -o vsz -p $1|grep -v VSZ`
	((MEMUsage /= 1000))
	echo $MEMUsage
}

MEMUsage=`GetMem $PID`
echo $MEMUsage

if [$MEMUsage -gt 400]
then
	exec /home/lumen/github/ss-bash/ssadmin.sh restart
fi

