def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p0 = vector([0, phi, 1])
p1 = vector([phi, 1, 0])
p2 = vector([0, phi, -1])

p3 = vector([phi, 1, 0])
p4 = vector([0, phi, 1])
p5 = vector([-1, 0, phi])
p6 = vector([0, -phi, 1])
p7 = vector([phi, -1, 0])

R3 = R(p0, p1, p2, p1, p2, p0)
R5 = R(p3, p4, p5, p5, p6, p7)

r.<x, z> = PolynomialRing(k)
y = phi**-2 - phi**-2*x
A = vector([x, y, z])
B = R3.inverse()*A
C = R5*A

eq0 = A.dot_product(B - C)
eq1 = B.dot_product(A - C)

eq3 = eq0*eq1.coefficient(z^2) - eq1*eq0.coefficient(z^2)

z_in_x = eq3(x, 0)/(eq3(x, 0) - eq3(x, 1))
print(z_in_x)
eq = eq1(x, z_in_x)
print(factor(eq.numerator()))
