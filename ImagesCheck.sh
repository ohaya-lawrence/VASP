#!/bin/bash
a=$(find [0-9][0-9] -type d)
mkdir Check
for i in $a
do
cp ./$i/CONTCAR ./Check/CONTCAR-$i
sed -i s/NaN//g ./Check/CONTCAR-$i
sed -i '/^ *$/d' ./Check/CONTCAR-$i
sed -i s/''//g  ./Check/CONTCAR-$i
done
cp ./00/POSCAR ./Check/CONTCAR-00
cp ./06/POSCAR ./Check/CONTCAR-06
