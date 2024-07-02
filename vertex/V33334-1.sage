(-x + 1)/(x + 1)
x^3 + x^2 + x - 1
def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('xi')
k.<xi> = NumberField(xi^3 + xi^2 + xi - 1)

p0 = vector([1, 1, 1])
p1 = vector([-1, 1, 1])
p2 = vector([-1, -1, 1])
p3 = vector([1, -1, 1])

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

