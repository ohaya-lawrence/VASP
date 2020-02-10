import math
import string

#############extract the ZPE and vibrational entropy from the OUTCAR#####################
#   IBRION = 5
#   NSW   = 1
#   POTIM = 0.02
#   NFREE = 2
#   ISYM = 0
##################################


#Boltzmann constant in eV/K
kb = 8.6173324e-05
T = 291 #K
kbT = kb * T   # in 1/eV

#Planck constant in eV s
h = 4.135667516e-15 

#Speed of light (cm/s)
c0 = 2.99792458e10

ft=open("tmp","w")
for line in open("OUTCAR"):
  if "f  =" in line:
     ft.write(line)
ft.close()

f=open("tmp", "r")
fr=f.readlines()
f.close()

Frequency = []
Energy = []
for a in fr:
	tmp=[]
	tmp=a.split()
	Frequency.append(float(tmp[7]))  #imaginary part is not considered
	Energy.append(float(tmp[9])*0.001)    

print "\nfrequency mode:(cm^-1) " 
print Frequency
print "energy: (eV)"
print Energy


ZPE=0
ZPE_check=0
S_vib=0
for b in range(0,len(Frequency)):
	ZPE = ZPE + 0.5*h*float(Frequency[b])*c0   #0.5*h*c*v
	ZPE_check = ZPE_check + 0.5*float(Energy[b]) #sum of the energy
	S_vib = S_vib + kb*(Energy[b]/(kbT*(math.exp(Energy[b]/kbT)-1)) - math.log(1-math.exp(-Energy[b]/kbT)))
        #see https://wiki.fysik.dtu.dk/ase/ase/thermochemistry/thermochemistry.html

print "\nZPE (eV):  %f \nZPE_check (eV):  %f  \nS_vib (eV/K):  %f \nT*S_vib (eV): %f" % (ZPE, ZPE_check, S_vib, T*S_vib) 
