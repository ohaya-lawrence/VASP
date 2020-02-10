#!/bin/bash
sed -i s/'\r'//g POSCAR
sed -i s/'^M'//g POSCAR
ARRAY=$(awk 'NR==6{print}' POSCAR)
echo $ARRAY
for i in $ARRAY
do
cp ~/yanshi/$i/POTCAR ./$i
cat $i >> POTCAR
rm -f $i
done

