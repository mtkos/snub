def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p0 = vector([1, 0, phi])
p1 = vector([-1, 0, phi])
p2 = vector([0, -phi, 1])

p3 = vector([1, 0, phi])
p4 = vector([phi, -1, 0])
p5 = vector([1, 0, -phi])
p6 = vector([0, phi, -1])
p7 = vector([0, phi, 1])

R3 = R(p0, p1, p2, p1, p2, p0)
R52 = R(p3, p4, p5, p5, p6, p7)

r.<x> = PolynomialRing(k)
y = 0
z = phi^-1
A = vector([x, y, z])
B = R3*A
C = R52.inverse()*A

eq = A.dot_product(B - C)

print(eq)

print(factor(eq.numerator()))

print(det(R3))
print(det(R52))
