# Alunos: Eduarda, Junior, Miguel

using LinearAlgebra

function fixedpoint(a, g, error)
    x = g(a)
    while norm(x-a) > error
      a = x
      x = g(a)
    end
    return x
  end

  function bisection(a, b, f, error) 
    x = (a + b) / 2
    while abs(f(x)) > error
        if f(a) * f(x) > 0
            a = x
        else
            b = x
        end
        x = (a + b) / 2
    end
    return x
end

function seidel(A, B, k, error)
    n = size(B,1)
    X = zeros(n)
    K = zeros(n)
    for l = 1:k
      for i = 1:n
        count = [0.0 0.0]
        for j = 1:i-1
          count[1] += A[i,j]*K[j]
        end
        for j = i+1:n
          count[2] += A[i,j]*X[j]
        end
        K[i] = (B[i]-count[1]-count[2])/A[i,i]
      end
      if norm(X-K) < error
        break
      end
      X = copy(K)
    end
    return X
  end

# Questão 1

E = 500.125
K = 272.975

f(x) = 5.67*10^(-8)*x^4 + 0.4*(x - K) - E

a, b = -0.1, 500
error = 10^(-10)

resposta = bisection(a, b, f, error)
println("Questão 1:")
println("Utilizando bissecção: T = $(resposta)\n")


# Questão 2
d = 500
fmax = 50

g(x) = x*(cosh(d/(2*x))-1) - fmax

a, b = 0.1, 1000
error = 10^(-10)

resposta = bisection(a, b, g, error)
println("Questão 2:")
println("Utilizando bissecção: C = $(resposta)\n")


# Questão 3

freq = 10^3
L = 100*10^(-3)
R = 10^3
tan = 2*pi*freq*L/R     
a_v = atan(tan)

f(x) = sin(x - a_v) + sin(a_v)*exp(-x/tan)
deg2rad(degrees) = degrees * π / 180
rad2deg(radians) = radians * 180 / π

a_degtorad = deg2rad(114) # 2 rad
b_degtorad = deg2rad(286) # 5 rad

error = 10^(-10)
resposta = bisection(a_degtorad, b_degtorad, f, error)

println("Questão 3:")
println("Utilizando bissecção: b = $(rad2deg(resposta)) graus\n")

# Questão 4

A = [17 -2 -3; -5 21 -2; -5 -5 22]
B = [500; 200; 30]

k = 100
error = 10^(-10)
resposta = seidel(A, B, k, error)
println("Questão 4:")
println("Utilizando Gauss-Seidel: R1 = $(resposta[1]), R2 = $(resposta[2]), R3 = $(resposta[3])\n")

# Questão 5
R1 = R2 = R3 = 10
V1 = V2 = 100

A = [20 10; 
     10 20]
B = [100; 100]

k = 100
error = 10^(-10)

I1, I2 = seidel(A, B, k, error)

IR3 = (V1 - I1*R1)/R3
println("Questão 5:")
println("Utilizando Gauss-Seidel: IR3 = $(IR3)\n")

# Questão 6

A = [
        6 -3 -3 0 0; 
        -3 6 0 -3 0; 
        -3 0 6 -1 -2; 
        0 -3 -1 5 0; 
        0 0 -2 0 3]
B = [0; 6; 0; 2; -3]

k = 100
error = 10^(-10)
resposta = seidel(A, B, k, error)
println("Questão 6:")
println("Utilizando Gauss-Seidel: V1 = $(resposta[1]), V2 = $(resposta[2]), V3 = $(resposta[3]), V4 = $(resposta[4]), V5 = $(resposta[5])\n")


# Questão 7


h(x) = x - inv(jacobian(x))*F(x)

F(x) = [x[1]^4 + 0.06823*x[1] - x[2]^4 - 0.05848*x[2] - 0.01753;
        x[1]^4 + 0.05848*x[1] - 2*x[2]^4 - 0.11696*x[2] - 0.00254]

jacobian(x) = [4*x[1]^3 + 0.06823 -4*x[2]^3 - 0.05848;
               4*x[1]^3 + 0.05848 -8*x[2]^3 - 0.11696]

x = [0.5, 0.5]
error = 10^(-10)
resposta = fixedpoint(x, h, error)
println("Questão 7:")
println("Uutilizando Newton-Raphson: T1 = $(resposta[1]), T2 = $(resposta[2])\n")