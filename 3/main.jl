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

# Exercício 3.2.1
println("Exercício 3.2.1")
f(x) = sqrt(x) - cos(x)
error = 1e-4
r = bisection(0, 1, f, error)
println("$(round(r, digits = 4))")

# Exercício 3.2.2
println("\nExercício 3.2.2")
f(x) = 5*sin(x^2) - exp(x/10)
error = 1e-5

r = bisection(0.4, 0.5, f, error)
println("(0.4, 0.5) -> $(round(r, digits = 5))")

r = bisection(1.7, 1.8, f, error)
println("(1.7, 1.8) -> $(round(r, digits = 4))")

r = bisection(2.5, 2.6, f, error)
println("(2.5, 2.6) -> $(round(r, digits = 4))")

# Exercício 3.2.8
k = 1.38e-23
T = 300
q = 1.6e-19
Ir = 10^-12
Vt = (k*T)/q

#=
Id = Ir*(exp(Vd/Vt) - 1)
Id = V/R - Vd/R
V/R - Vd/R = Ir*(exp(Vd/Vt) - 1)
V - Vd = R*(Ir*(exp(Vd/Vt) - 1))
f(Vd) = R*(Ir*(exp(Vd/Vt) - 1)) - V + Vd
=#
f(Vd) = R*(Ir*(exp(Vd/Vt) - 1)) - V + Vd
tol = 1e-3



println("\nExercício 3.2.8")

V = 30
R = 1e3
r = bisection(0.6, 0.7, f, tol)
println("a) Vd = $(trunc(r, digits = 3))")

V = 3
R = 1e3
r = bisection(0.5, 0.6, f, tol)
println("b) Vd = $(trunc(r, digits = 3))")

V = 3
R = 10e3
r = bisection(0.4, 0.6, f, tol)
println("c) Vd = $(trunc(r, digits = 3))")

V = 300e-3
R = 1e3
r = bisection(0.2, 0.4, f, tol)
println("d) Vd = $(trunc(r, digits = 3))")

V = -300e-3
R = 1e3
r = bisection(-0.4, -0.2, f, tol)
println("e) Vd = $(trunc(r, digits = 3))")

V = -30
R = 1e3
r = bisection(-30.1, -29.9, f, tol)
println("f) Vd = $(trunc(r, digits = 3))")

V = -30
R = 10e3
r = bisection(-30.1, -29.9, f, tol)
println("g) Vd = $(trunc(r, digits = 3))")