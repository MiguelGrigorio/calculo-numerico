function fixedpoint(a, g, error)
    x = g(a)
    while abs(x - a) > error
        a = x
        x = g(a)
    end
    return x
end

function secant(a, b, f, error)
    g(a, b) = (a*f(b)-b*f(a))/(f(b)-f(a))
    x = g(a, b)
    while abs(x - b) > error
      a = b
      b = x
      x = g(a, b)
    end
    return x
end

function newton(a, f, f_derivado, error)
    x = a - f(a)/f_derivado(a)
    while abs(x - a) > error
        a = x
        x = a - f(a)/f_derivado(a)
    end
    return x
end

# Exercício 3.3.1
g(x) = exp(x) - 2
error = 1e-8

r1 = fixedpoint(-1.8, g, error)
println("Exercício 3.3.1")
println("Utilizando ponto fixo: $(round(r1, digits = 7))")

# Exercício 3.4.1
f(x) = cos(x) - x^2
f1(x) = -sin(x) - 2*x
error = 1e-5

r2 = newton(1, f, f1, error)
println("\nExercício 3.4.1")
println("Utilizando Newton: $(round(r2, digits = 5))")

# Exercício 3.6.3
f(x) = 2*x - exp(-x^2)
error = 1e-5
r3 = secant(1, 2, f, error)

println("\nExercício 3.6.3")
println("Utilizando secante: $(round(r3, digits = 5))")

# Exercício 3.6.4
k = 1.38e-23
T = 300
q = 1.6e-19
Ir = 1e-12
Vt = (k*T)/q

#=
Id = Ir*(exp(Vd/Vt) - 1)
Id = V/R - Vd/R
V/R - Vd/R = Ir*(exp(Vd/Vt) - 1)
V - Vd = R*(Ir*(exp(Vd/Vt) - 1))
f(Vd) = R*(Ir*(exp(Vd/Vt) - 1)) - V + Vd
=#
f(Vd) = R*(Ir*(exp(Vd/Vt) - 1)) - V + Vd
error = 1e-3

println("\nExercício 3.2.8")
println("Utilizando secante:")

V = 30
R = 1e3
r4 = secant(0.6, 0.7, f, error)
println("a) Vd = $(round(r4, digits = 3))")

V = 3
R = 1e3
r4 = secant(0.5, 0.6, f, error)
println("b) Vd = $(round(r4, digits = 3))")

V = 3
R = 10e3
r4 = secant(0.45, 0.55, f, error)
println("c) Vd = $(round(r4, digits = 3))")

V = 300e-3
R = 1e3
r4 = secant(0.2, 0.4, f, error)
println("d) Vd = $(round(r4, digits = 3))")

V = -300e-3
R = 1e3
r4 = secant(-0.4, -0.2, f, error)
println("e) Vd = $(round(r4, digits = 3))")

V = -30
R = 1e3
r4 = secant(-30.1, -29.9, f, error)
println("f) Vd = $(round(r4, digits = 3))")

V = -30
R = 10e3
r4 = secant(-30.1, -29.9, f, error)
println("g) Vd = $(round(r4, digits = 3))")