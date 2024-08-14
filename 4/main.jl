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
error = 10^(-8)

r1 = fixedpoint(-1.8, g, error)
println("Utilizando ponto fixo: $(round(r1, digits = 7))")

# Exercício 3.4.1
f(x) = cos(x) - x^2
f1(x) = -sin(x) - 2*x
error = 10^(-5)

r2 = newton(1, f, f1, error)
println("Utilizando Newton: $(round(r2, digits = 5))")

# Exercício 3.6.3
f(x) = 2*x - exp(-x^2)
error = 10^(-5)
r3 = secant(1, 2, f, error)