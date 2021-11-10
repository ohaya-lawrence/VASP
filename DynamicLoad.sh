#!/bin/bash
for nodename  in `pbsnodes -l all | awk '{print $1}'`
do
checknode $nodename |grep State >> tmp.node
done
busynode=$(grep -o Busy tmp.node | wc -l)
partlynode=$(grep -o Running tmp.node | wc -l)
let allnodes=busynode+partlynode
if (($allnodes <= 5));then
sed -i s/'MAXPROC=176'/'MAXPROC=276'/ /public/software/pbs/maui/maui.cfg
service maui restart
else
sed -i s/'MAXPROC=276'/'MAXPROC=176'/ /public/software/pbs/maui/maui.cfg
service maui restart
fi
rm -f  tmp.node
