def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p0 = vector([1, 0, phi])
p1 = vector([-1, 0, phi])
p2 = vector([0, -phi, 1])

p3 = vector([phi, 1, 0])
p4 = vector([0, phi, 1])
p5 = vector([-1, 0, phi])
p6 = vector([0, -phi, 1])
p7 = vector([phi, -1, 0])

R3 = R(p0, p1, p2, p1, p2, p0)
R52 = R(p3, p4, p5, p5, p6, p7)

r.<x, y> = PolynomialRing(k)
z = -phi^-2*x + phi^-1*y + phi^-3*2
A = vector([x, y, z])
B = R3*A
C = R52.inverse()*A

eq0 = A.dot_product(B - C)
eq1 = B.dot_product(A - C)

print(eq0)
print(eq1)

eq3 = eq0*eq1.coefficient(x^2) - eq1*eq0.coefficient(x^2)
print(eq3)

x_in_y = eq3(0, y)/(eq3(0, y) - eq3(1, y))
print(x_in_y)
eq = eq0(x_in_y, y)
print(factor(eq.numerator()))
