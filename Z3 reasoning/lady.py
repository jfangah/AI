# -- coding: utf-8 --
from z3 import *
room1=Bool('room1')
room2=Bool('room2')
room3=Bool('room3')

t1=Bool('t1')
l1=Bool('l1')
t2=Bool('t2')
l2=Bool('l2')
t3=Bool('t3')
l3=Bool('l3')


a=(Or(And(room1,Not(room2),Not(room3),t1),And(Not(room1),l1)))
b=(Or(And(room2,Not(room1),Not(room3),l2),And(Not(room2),t2)))
c=Or(And(Not(room3),l2),And(room3,t2))
e=(Or(And(room1,Not(room2),Not(room3)),And(Not(room1),room2,Not(room3)),And(Not(room1),Not(room2),room3)))
f=(Or(And(l1,t2,t3),And(t1,l2,t3),And(t1,t2,l3)))

d=Or(And(t1,Not(l1)),And(l1,Not(t1)))
g=Or(And(t2,Not(l2)),And(l2,Not(t2)))
h=Or(And(t3,Not(l3)),And(l3,Not(t3)))


print('roomi represents the authenticity of the sign of roomi')
print('ti indicates whether there is a tiger in roomi')
print('li indicates whether there is a lady in roomi')
solve(a,b,c,d,e,f,g,h)
