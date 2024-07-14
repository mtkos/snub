def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('xi')
k.<xi> = NumberField(xi^3 + xi^2 + xi - 1)

p0 = vector([1, -1, 1])
p1 = vector([1, 1, 1])
p2 = vector([-1, 1, 1])
p3 = vector([-1, -1, 1])

p4 = vector([1, 1, -1])
p5 = p2
p6 = p0

R3 = R(p4, p5, p6, p5, p6, p4)
R4 = R(p0, p1, p2, p1, p2, p3)

x = xi
y = (-xi + 1)/(xi + 1)
z = 1

v = vector([x, y, z])
w = R4*v

r2 = v.dot_product(v)
l2 = (v - w).dot_product(v - w)
mr2 = (v + w).dot_product(v + w)/4

print(r2)
print(l2)
print(mr2)

print()

print(r2/l2)
print(mr2/l2)

n0 = (v + R4*v + R3.inverse()*v)
n1 = R3*n0
n2 = R4.inverse()*n0
print(n0)
print(n1)
print(n2)
