#!/bin/bash
mkdir tmp
cp INCAR KPOINTS POTCAR ./tmp
cp CONTCAR ./tmp/POSCAR
rm -f *
rm -r ZPE
rm -r zpe
mv ./tmp/* .
rm -r tmp 
