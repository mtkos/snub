from numpy import roots

phi = .5 + .5*5.**.5
tauinv = roots([1., 1., 1., -1.])[2].real
xi = roots([1., 2., 0., -phi**2])[2].real
xi0 = roots([1., 2., 0., -phi**-2])[2].real
xi1 = roots([1., 2., 0., -phi**-2])[1].real
xi2 = roots([1., 2., 0., -phi**-2])[0].real
xi3 = roots([2.,  -5.,  0., 3,  1.])[1].real
xi4 = roots([2.,  -5.,  0., 3,  1.])[0].real
xi5 = roots([1., 0., -1., -1.])[0].real
xi6 = roots([1., 3., phi**-2])[1].real
xi7 = roots([1., 3., phi**-2])[0].real
xi8 = roots([1., 0., -phi**-1])[1].real
xi9 = roots([1., 0., -phi**-1])[1].real
