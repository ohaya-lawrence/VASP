#!/bin/bash
grep "FORCES: max atom, RMS" OUTCAR >> tmp.force
a=$(awk '{print NR}' tmp.force|tail -n1)
for ((i=1; i<="$a"; i++))
do
b=$(awk 'NR=="'"$i"'"{print $5}' tmp.force)
echo "$i  $b" >> force.plot
done
rm tmp.force
