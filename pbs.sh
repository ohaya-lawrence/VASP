#!/bin/bash
qstat -a >> ~/tmp/PBS/tmp
ARRAY1=$(awk 'NR>=6{print $1}' ~/tmp/PBS/tmp)
for i in $ARRAY1
do
qstat -f $i >> ~/tmp/PBS/tmp$i
(grep "$i" ~/tmp/PBS/tmp) >> ~/tmp/PBS/tmp2$i
b=$(awk 'NR==1{print $10}' ~/tmp/PBS/tmp2$i )
a=$(grep 'init_work_dir' ~/tmp/PBS/tmp$i | cut -c21-100)
e=$(awk 'NR==1{print $7}' ~/tmp/PBS/tmp2$i)
echo "$i   $e   $b   $a"
echo "$i   $e   $b   $a" >> ~/tmp/PBS/tmp3
done
echo "where are we going?"
read -a c
grep "$c" ~/tmp/PBS/tmp3 >> ~/tmp/PBS/tmp4
d=$(awk 'NR==1{print $4}' ~/tmp/PBS/tmp4)
cd $d
rm ~/tmp/PBS/tm*
# please use "source"

