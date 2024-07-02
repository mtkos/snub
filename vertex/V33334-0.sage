def R(p0, p1, p2, p3, p4, p5):
    return matrix([p3, p4, p5]).transpose()*matrix([p0, p1, p2]).inverse().transpose()

p0 = vector([1, -1, 1])
p1 = vector([1, 1, 1])
p2 = vector([-1, 1, 1])
p3 = vector([-1, -1, 1])

p4 = vector([1, 1, -1])
p5 = p2
p6 = p0

R4 = R(p0, p1, p2, p1, p2, p3)
R3 = R(p4, p5, p6, p5, p6, p4)

r.<x, y> = PolynomialRing(QQ)
z = 1
A = vector([x, y, z])
B = R4*A
C = R3.inverse()*A

eq0 = A.dot_product(B - C)
eq1 = B.dot_product(A - C)

print(eq0)
print(eq1)

eq2 = eq0*eq1.coefficient(y^2) - eq1*eq0.coefficient(y^2)

y_in_x = eq2(x, 0)/(eq2(x, 0) - eq2(x, 1))
print(y_in_x)
eq = eq1(x, y_in_x)
print(eq.numerator().factor())

