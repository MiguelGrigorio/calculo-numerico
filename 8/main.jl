using LinearAlgebra

P(x) = [1 x[1] x[1]^2 x[1]^3 ;
  1 x[2] x[2]^2 x[2]^3 ;
  1 x[3] x[3]^2 x[3]^3 ;
  1 x[4] x[4]^2 x[4]^3 ]

p(x, y) = P(x) \ y

x = [0; 1; 2; 3]
y = [1; 6; 5; -8]

a = p(x, y)
println(a)

f(x) = a[1] + a[2]*x + a[3]*x^2 + a[4]*x^3

r = f(0)
println(r)

# Exercicio 6.1.1
x = [-2 ; 0 ; 1 ; 2]
y = [-47 ; -3 ; 4 ; 41]

a = p(x, y)
println(a)

# Exercicio 6.1.2
x = [-1 ; 0.5 ; 1 ; 1.25]
y = [1.25 ; 0.5 ; 1.25 ; 1.8125]

a = p(x, y)
println(a)