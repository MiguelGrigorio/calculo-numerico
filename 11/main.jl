function pontomedio(f, a, b)
  h = b - a
  return h*(f((a+b)/2))
end

function trapezio(f, a, b)
  h = b - a
  return h*(((1/2)*f(a))+((1/2)*f(b)))
end

function simpson(f, a, b)
  h = (b - a) / 2
  return h*(((1/3)*f(a))+((4/3)*f((a+b)/2))+((1/3)*f(b)))
end

function integracao(f, i, a, b, t)
  s = 0
  c = a
  d = a + t
  while d <= b
    s += i(f, c, d)
    c = d
    d += t
  end
  return s
end

# Exercício 9.2.1
println("Exercício 9.2.1")
f(x) = exp(-x)

println("a) f(x) = e^(-x)")
println("Integração por ponto médio: ", integracao(f, pontomedio, 0, 1, 0.5))
println("Integração por trapézio: ", integracao(f, trapezio, 0, 1, 0.5))
println("Integração por Simpson: ", integracao(f, simpson, 0, 1, 0.5))

f(x) = x^2

println("b) f(x) = x^2")
println("Integração por ponto médio: ", integracao(f, pontomedio, 0, 1, 0.5))
println("Integração por trapézio: ", integracao(f, trapezio, 0, 1, 0.5))
println("Integração por Simpson: ", integracao(f, simpson, 0, 1, 0.5))

f(x) = x^3

println("c) f(x) = x^3")
println("Integração por ponto médio: ", integracao(f, pontomedio, 0, 1, 0.5))
println("Integração por trapézio: ", integracao(f, trapezio, 0, 1, 0.5))
println("Integração por Simpson: ", integracao(f, simpson, 0, 1, 0.5))

f(x) = x*exp(-x^2)

println("d) f(x) = xe^(-x^2)")
println("Integração por ponto médio: ", integracao(f, pontomedio, 0, 1, 0.5))
println("Integração por trapézio: ", integracao(f, trapezio, 0, 1, 0.5))
println("Integração por Simpson: ", integracao(f, simpson, 0, 1, 0.5))

f(x) = 1/(x^2+1)

println("e) f(x) = 1/(x^2+1)")
println("Integração por ponto médio: ", integracao(f, pontomedio, 0, 1, 0.5))
println("Integração por trapézio: ", integracao(f, trapezio, 0, 1, 0.5))
println("Integração por Simpson: ", integracao(f, simpson, 0, 1, 0.5))

f(x) = x/(x^2+1)

println("f) f(x) = x/(x^2+1)")
println("Integração por ponto médio: ", integracao(f, pontomedio, 0, 1, 0.5))
println("Integração por trapézio: ", integracao(f, trapezio, 0, 1, 0.5))
println("Integração por Simpson: ", integracao(f, simpson, 0, 1, 0.5))

# Exercício 9.2.3
println("Exercício 9.2.3")

f(x) = exp(4-(x^2))
# o t é o número de subintervalos
# onde t = (b - a) / n
# então t = 3/n
n = 3

println("f(x) = e^(4-x^2)")
println("n = 3")
println("Integração por ponto médio: ", integracao(f, pontomedio, 2, 5, 3/n))
println("Integração por trapézio: ", integracao(f, trapezio, 2, 5, 3/n))
println("Integração por Simpson: ", integracao(f, simpson, 2, 5, 3/n))

n = 5

println("n = 5")
println("Integração por ponto médio: ", integracao(f, pontomedio, 2, 5, 3/n))
println("Integração por trapézio: ", integracao(f, trapezio, 2, 5, 3/n))
println("Integração por Simpson: ", integracao(f, simpson, 2, 5, 3/n))

n = 7

println("n = 7")
println("Integração por ponto médio: ", integracao(f, pontomedio, 2, 5, 3/n))
println("Integração por trapézio: ", integracao(f, trapezio, 2, 5, 3/n))
println("Integração por Simpson: ", integracao(f, simpson, 2, 5, 3/n))

n = 9

println("n = 9")
println("Integração por ponto médio: ", integracao(f, pontomedio, 2, 5, 3/n))
println("Integração por trapézio: ", integracao(f, trapezio, 2, 5, 3/n))
println("Integração por Simpson: ", integracao(f, simpson, 2, 5, 3/n))