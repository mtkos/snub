def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p0 = vector([1, 0, phi])
p1 = vector([phi, -1, 0])
p2 = vector([phi, 1, 0])

p3 = vector([0, phi, -1])
p4 = vector([0, phi, 1])
p5 = vector([1, 0, phi])
p6 = vector([phi, -1, 0])
p7 = vector([1, 0, -phi])

R3 = R(p0, p1, p2, p1, p2, p0)
R53 = R(p3, p4, p5, p6, p7, p3)

l.<xi> = k[]
k.<xi> = k.extension(xi^3 - xi - 1)

x = xi
y = ((-4*phi + 8)*xi + (-4*phi + 4))/((4*phi - 8)*xi + (4*phi - 8))
z = 2 - phi*x - phi^-1*y

print(x)
print(y)
print(z)

print()

v = vector([x, y, z])
for i in range(5):
    w = R53**i*v
    for j in range(3):
        print(i, j, w[j])
        print(w[j].minpoly())
        print()

w = R3*v

r2 = v.dot_product(v)
l2 = (v - w).dot_product(v - w)
mr2 = (v + w).dot_product(v + w)/4

print(r2)
print(l2)
print(mr2)

print(r2/l2)
print(mr2/l2)

n0 = v + R3*v + R53.inverse()*v
n1 = R3.inverse()*n0
n2 = R53*n0

print(n0)
print(n1)
print(n2)

print(v)
