def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p3 = vector([phi, 1, 0])
p4 = vector([0, phi, 1])
p5 = vector([-1, 0, phi])
p6 = vector([0, -phi, 1])
p7 = vector([phi, -1, 0])

R5 = R(p3, p4, p5, p4, p5, p6)

l.<xi> = k[]
k.<xi> = k.extension(xi^3 + 2*xi^2 - phi - 1)

x = (-3/2*xi^2 + (-1/2*phi - 1/2)*xi + (phi + 1))/((1/2*phi - 1/2)*xi)
y = phi^2 - phi^2*xi
z = xi

print(x)
print(y)
print(z)

print()

v = vector([x, y, z])
for i in range(5):
    w = R5**i*v
    for j in range(3):
        print(w[j])
        print(w[j].minpoly())
        print()

w = R5*v

r2 = v.dot_product(v)
l2 = (v - w).dot_product(v - w)
mr2 = (v + w).dot_product(v + w)/4

print(r2)
print(l2)
print(mr2)

print(r2/l2*(1 - xi))
print(mr2/l2*(1 - xi))
