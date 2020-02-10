#!/bin/bash
# powered by ohaya lawrence
sed -i s/'  0.00000000E+00  0.00000000E+00  0.00000000E+00'//g POSCAR
sed -i '/^ *$/d' POSCAR
a=$(cat POSCAR|grep 'Selective dynamics')
if [ ! -n "$a" ]; then
sed -i '8i  Selective dynamics' POSCAR
fi
(awk 'NR>=10{print $3}' POSCAR|sort -n) >tmp
sed -i '10,$s/$/ F F F/' POSCAR
echo "please input layers:"
read -a b
echo "how many adsorption element:"
read -a c
d=$(awk '{print NR}' tmp|tail -n1)
e=$(awk 'BEGIN{b="'"$b"'";c="'"$c"'";d="'"$d"'";print(c+(d-c)/b*2);}')
f=$(tail -$e tmp | uniq)
for g in $f
do
sed -i s/''$g' F F F'/''$g' T T T'/ POSCAR
done
sed -i s/''//g POSCAR
rm tmp


