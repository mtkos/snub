## computing coordinates

How the coordinates are discovered is best shown using the simple example of the snub cube. To obtain the coordinates (x, y, z) of a vertex, let us call it **A**, we can proceed as follows: Let **B**
be the image of **A** under the rotation by 90 degrees around the z-axis, counterclockwise. Let **C** be the image of **A** under the rotation by 120 degrees around the axis (1, 1, 1), clockwise.
 The triangle **ABC** should be equilateral, which can be expressed by the two equations (**A**, **B**)=(**A**, **C**)=(**B**, **C**), where the brackets '(,)' denote the inner product. This determines
**A**=(x,y,z) up to a scalar multiple. In this case, a logical choice is to have z=1. The two equations, then, are (at most) quadratic in x and y. Subtracting a suitable multiple of one of
them from the other, we can get an equation which is linear in y. Thus, y can be solved as a rational function of x. Substituting in the remaining equation gives a polynomial equation for x. 
The equation, x^3 + x^2 + x - 1 = 0, has one real solution, which is equal to the inverse of the so-called trinomial constant. These
computations can be done by hand. It is easier, however, to use a computer algebra system. The whole computation is done by the Sagemath program V33334-0.sage. Computing y from x we get a complete set
of coordinates. Coordinates for the other vertices can be obtained by applying the (in this case 24) elements of the symmetry group. Metric properties like edge length, circumradius and midradius
are also easily obtained, as is shown in the program V33334-1.sage. For the more complicated snub star polyhedra, which all have icosahedral symmetry, the computations look very difficult to do
by hand. The principles remain the same, however, and, using Sagemath, we obtain vertices for all snub uniform star polyhedra. A bit of manual work is required to get 'simple' coordinates. As
a guideline, a coordinate is simple when its minimal polynomial is simple, for instance because it has rational coefficients.
To ease this work, we start by computing a vertex. Then, we rotate this vertex by multiples of 72 degrees around a five-fold symmetry axis, and compute minimal polynomials of the resulting
coordinates. This usually gives an indication for the two rotation axes to use and the normalization of one of the coordinates.

The snub star polyhedra happen to occur in small families. For instance, the great snub icosidodecahedron (V33335\_2), great inverted snub icosidodecahedron (V33335\_3) and great retrosnub 
icosidodecahedron (V33335\_2\_2) all have the same symbolic coordinates. They are different because they correspond to different real roots of one degree three polynomial. For this reason,
there is a program V33335\_2-0.sage, but not V33335\_3-0.sage.

The great dirhombicosidodecahedron (V45\_34345\_243\_2) is a little bit exceptional, because it has snub squares instead of snub triangles. Hence, in this case, the computations are different.
