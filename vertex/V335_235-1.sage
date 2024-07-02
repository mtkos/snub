def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p0 = vector([phi, 1, 0])
p1 = vector([0, phi, 1])
p2 = vector([-1, 0, phi])
p3 = vector([0, -phi, 1])
p4 = vector([phi, -1, 0])

R5 = R(p0, p1, p2, p1, p2, p3)
R52 = R(p0, p1, p2, p2, p3, p4)

l.<xi> = k[]
k.<xi> = k.extension(xi^4 - 5/2*xi^3 + 3/2*xi + 1/2)

x = ((-4*phi)*xi^2 + (4*phi)*xi + (-4*phi - 4))/((-8*phi - 4)*xi + (-8*phi - 4))
z = xi
y = -phi^2*x - phi*z + 2*phi

print(x)
print(y)
print(z)

print()

v = vector([x, y, z])
for i in range(5):
    w = R5**i*v
    for j in range(3):
        print(i, j, ':', w[j])
        print(w[j].minpoly())
        print()

w = R52*v

r2 = v.dot_product(v)
l2 = (v - w).dot_product(v - w)
mr2 = (v + w).dot_product(v + w)/4

print(r2)
print(l2)
print(mr2)

v = ((xi + 1)*v)
print(v)
