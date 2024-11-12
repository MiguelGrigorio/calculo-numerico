include("../9/main.jl") # Chamando a função trinv para o exercicio 8.1.4

dp(f,x,h) = (f(x+h)-f(x))/h
dr(f,x,h) = (f(x)-f(x-h))/h
dc(f,x,h) = (f(x+h)-f(x-h))/(2*h)

# Exercicio 8.1.1
println("Exercicio 8.1.1")
f(x) = sin(x)

r1 = dp(f, 2, 1e-2)
r2 = dp(f, 2, 1e-3)
println("Progressiva:")
println(round(r1, digits=5), " ", round(r2, digits=5))

r1 = dr(f, 2, 1e-2)
r2 = dr(f, 2, 1e-3)
println("Regressiva:")
println(round(r1, digits=5), " ", round(r2, digits=5))

r1 = dc(f, 2, 1e-2)
r2 = dc(f, 2, 1e-3)

println("Central:")
println(round(r1, digits=5), " ", round(r2, digits=5))

println("Exata:")
println(round(cos(2), digits=5))

# Exercicio 8.1.4
println("Exercicio 8.1.4")

vi = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
vo = [0.0, 1.05, 1.83, 2.69, 3.83, 4.56, 5.49, 6.56, 6.11, 7.06, 8.29]

# d) vo = a1*vi + a3*vi^3
# derivada de vo = a1 + 3*a3*vi^2 (ganho)

v(x) = [
    x[1] x[1]^3;
    x[2] x[2]^3;
    x[3] x[3]^3;
    x[4] x[4]^3;
    x[5] x[5]^3;
    x[6] x[6]^3;
    x[7] x[7]^3;
    x[8] x[8]^3;
    x[9] x[9]^3;
    x[10] x[10]^3;
    x[11] x[11]^3;
]
a1, a3 = trinv(v, vi, vo)
f(x) = vo[findfirst(isequal(x), vi)]

# vi = 1 (índice 3)
# vi = 4.5 (índice 10)

a = dp(f, 1, 0.5)
b = dr(f, 1, 0.5)
c = dc(f, 1, 0.5)
d = a1 + 3*a3

println("vi = 1")
println("a: ", round(a, digits=2))
println("b: ", round(b, digits=2))
println("c: ", round(c, digits=2))
println("d: ", round(d, digits=2))

a = dp(f, 4.5, 0.5)
b = dr(f, 4.5, 0.5)
c = dc(f, 4.5, 0.5)
d = a1 + 3*a3*4.5^2

println("vi = 4.5")
println("a: ", round(a, digits=2))
println("b: ", round(b, digits=2))
println("c: ", round(c, digits=2))
println("d: ", round(d, digits=2))