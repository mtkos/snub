def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p0 = vector([1, 0, phi])
p1 = vector([0, phi, 1])
p2 = vector([-1, 0, phi])

p3 = vector([phi, 1, 0])
p4 = vector([1, 0, phi])
p5 = vector([0, -phi, 1])
p6 = vector([0, -phi, -1])
p7 = vector([1, 0, -phi])

R3 = R(p0, p1, p2, p1, p2, p0)
R53 = R(p3, p4, p5, p6, p7, p3)

r.<x, y> = PolynomialRing(k)
z = phi^-1
A = vector([x, y, z])
B = R3*A
C = R53.inverse()*A

eq0 = A.dot_product(B - C)
eq1 = B.dot_product(B + C -2*A)

print(eq0)
print(eq1)

eq3 = eq0*eq1.coefficient(y^2) - eq1*eq0.coefficient(y^2)
print(eq3)

y_in_x = eq3(x, 0)/(eq3(x, 0) - eq3(x, 1))
print(y_in_x)
eq = eq1(x, y_in_x)
print(factor(eq.numerator()))

print(det(R3))
print(det(R53))

print(det(matrix([A, B, C])))
print(B + C)
