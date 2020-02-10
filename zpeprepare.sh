#!/bin/bash
cat > INCAR2 <<!
SYSTEM =O
ENCUT = 400
ISTART = 0
ICHARG = 2
ISMEAR = 1
SIGMA = 0.20
EDIFF = 1E-7
LWAVE=.FALSE.
LCHARG=.FALSE.
LREAL= Auto
ISIF=2
NFREE=2
NSW=1
POTIM = 0.015
IBRION = 5
#EDIFFG=-0.02
IALGO=48
NPAR = 4
ISYM = 0
!
mkdir zpe
mv INCAR2 ./zpe/INCAR
cp POTCAR KPOINTS  ./zpe
cp CONTCAR ./zpe/POSCAR
sed -i s/T/F/g ./zpe/POSCAR
echo "how many adsorption slement"
read -a a
b=$(awk 'BEGIN{a="'"$a"'";print (9+a);}')
sed -i '10,'$b' s/F/T/g' ./zpe/POSCAR
