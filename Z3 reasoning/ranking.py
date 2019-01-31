# -- coding: utf-8 --
from z3 import *
l = Int('l')
j = Int('j')
b = Int('b')
m = Int('m')

BML = Bool('BML')
BMJ = Bool('BMJ')
BMB = Bool('BMB')
BMM = Bool('BMM')
s=Solver()
s.add(And(l-b!=1,b-l!=1))

s.add(Or(Or(j-l == 1 , j-m == 1 , j-b == 1), Implies(j-l == 1, BML),
 Implies(j-m == 1, BMM), Implies(j-b == 1, BMB)))

s.add(b-j==1)

s.add(Or(BML,BMM))
s.add(Or(l==1,m==1))
s.add(And(And(l>0,l<5),And(j>0,j<5),And(b>0,b<5),And(m>0,m<5)))
s.add(And(m!=b,m!=j,m!=l,b!=j,b!=l,j!=l))

print('whose value is 4, who ranks first and the person whose value is 1 ranks the last')
print('BMi is true means i is biology major')
print(s.check())
print(s.model())