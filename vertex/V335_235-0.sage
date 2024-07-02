def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

var('phi')
k.<phi> = NumberField(phi^2 - phi - 1)

p0 = vector([phi, 1, 0])
p1 = vector([0, phi, 1])
p2 = vector([-1, 0, phi])
p3 = vector([0, -phi, 1])
p4 = vector([phi, -1, 0])

p5 = vector([1, 0, phi])
p6 = vector([phi, 1, 0])
p7 = vector([0, phi, -1])
p8 = vector([-phi, 1, 0])
p9 = vector([-1, 0, phi])

R52 = R(p0, p1, p2, p2, p3, p4)
R5 = R(p5, p6, p7, p6, p7, p8)

r.<x, z> = PolynomialRing(k)
y = -phi^2*x - phi*z + 2*phi
A = vector([x, y, z])
B = R52.inverse()*A
C = R5*A

eq0 = A.dot_product(B - C)
eq1 = B.dot_product(A - C)

print(eq0)
print(eq1)

eq3 = eq0*eq1.coefficient(x^2) - eq1*eq0.coefficient(x^2)
print(eq3)

x_in_z = (eq3(0, z)/(eq3(0, z) - eq3(1, z)))
print(x_in_z)
eq = eq0(x_in_z, z)
print(factor(eq.numerator()))
