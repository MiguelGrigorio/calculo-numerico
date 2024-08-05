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
error = 10^(-4)
r = bisection(0, 1, f, error)
println("$(round(r, digits = 4))")

# Exercício 3.2.2
println("\nExercício 3.2.2")
f(x) = 5*sin(x^2) - exp(x/10)
error = 10^(-5)

r = bisection(0.4, 0.5, f, error)
println("(0.4, 0.5) -> $(round(r, digits = 5))")

r = bisection(1.7, 1.8, f, error)
println("(1.7, 1.8) -> $(round(r, digits = 4))")

r = bisection(2.5, 2.6, f, error)
println("(2.5, 2.6) -> $(round(r, digits = 4))")

# Exercício 3.2.8
k = 8.617*10^(-5)
T = 300
q = 1.6*10^(-19)
Ir = 10^(-12)
Vt = k*T/q
Id = Ir*(exp(Vd/Vt) - 1)
error = 10^(-3)
V = 30
R = 1000
Id = V/R - Vd/R