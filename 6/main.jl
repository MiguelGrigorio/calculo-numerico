using LinearAlgebra

function fixedpoint(a, g, error)
  x = g(a)
  while norm(x-a) > error
    a = x
    x = g(a)
  end
  return x
end

F(x) = [ ((x[1]^2)/3 + x[2]^2 - 1) ;
         ((x[1]^2) + (x[2]^2)/4 - 1) ]

J(x) = [ (2*x[1]/3) (2*x[2]) ;
         (2*x[1]) (x[2]/2) ]

x = [1 ; 1]

g(x) =  x - (inv(J(x))*F(x))

error = 10^-8
r = fixedpoint(x, g, error)
#println(r)

#Exercício 5.1.2

F(x) = [ (2*x[1] - x[2] - cos(x[1])) ;
         (-x[1] + 2*x[2] - x[3] - cos(x[2]) );
         (-x[2] + x[3] - cos(x[3])) ]
J(x) = [ (2 + sin(x[1])) (-1) 0 ;
         (-1) (2 + sin(x[2])) (-1) ;
         0 (-1) (1 + sin(x[3])) ]


g(x) =  x - (inv(J(x))*F(x))

error = 10^-8

println("Exercício 5.1.2")
x = [1 ; 1 ; 1]
r = fixedpoint(x, g, error)
println("a) ", r) 

x = [-0.5 ; -2 ; -3]
r = fixedpoint(x, g, error)
println("b) ", r)

x = [-2 ; -3 ; -4]
r = fixedpoint(x, g, error)
println("c) ", r)

x = [0 ; 0 ; 0]
r = fixedpoint(x, g, error)
println("d) ", r)

#Exercício 5.1.5

F(x) = [ (6*x[1] - 2*x[2] + exp(x[3]) - 2);
         (sin(x[1]) - x[2] + x[3]);
         (sin(x[1]) + 2*x[2] + 3*x[3] - 1) ]

J(x) = [ 6  -2  exp(x[3]) ;
        cos(x[1]) -1  1 ;
        cos(x[1])  2  3 ]

g(x) =  x - (inv(J(x))*F(x))

x = [0 ; 0 ; 0]
error = 10^-5

println("Exercício 5.1.5")
r = fixedpoint(x, g, error)
println(r)

#Exercício 5.1.10

F(x) = [ (x[1]^2/8 + (x[2]-1)^2/5 - 1) ;
         (atan(x[1]) + x[1] - x[2] -x[2]^3) ]
J(x) = [ (x[1]/4)  (2*(x[2]-1)/5) ;
         (1/(1+x[1]^2) + 1) (-1 -3*x[2]^2) ]

g(x) =  x - (inv(J(x))*F(x))
x = [-1 ; -1]
error = 10^-5

println("Exercício 5.1.10")
r = fixedpoint(x, g, error)
println("Ponto 1: ", r)

x = [2.5 ; 1.5]
r = fixedpoint(x, g, error)
println("Ponto 2: ", r)