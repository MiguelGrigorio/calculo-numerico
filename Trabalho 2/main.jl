# Aluno: Miguel Grigorio

# 1 - Uma fábrica de laticínios, na etapa de resfriamento para fermentação dos produtos, utiliza diferentes tamanhos de serpentinas para alcançar as temperaturas ideais no processo de fabricação. De acordo com o manual do fabricante, as serpentinas seguem precisamente a fórmula para calcular a temperatura alcançada (em graus celsius) em função do tamanho (em metros) da serpentina:

#f(x)=a4x^3+a3x^2+a2x+a1

# A tabela abaixo contém as temperaturas na primeira linha, os metros de serpentina na segunda linha e o tamanho das novas serpentinas na terceira linha. Encontre os valores das temperaturas alcançadas para essas novas serpentinas.

#x = metros
#f(x) = temperatura

# Tabela    
temp = [4.9; 3.3; 3.0; 2.0]
metros = [1.5; 2.0; 2.2; 3.0]
novas_serpentinas = [1.75; 2.5; 2.75; 3.2]

# Sugestão: usar o método da interpolação polinomial.

P(x) = [1 x[1] x[1]^2 x[1]^3 ;
  1 x[2] x[2]^2 x[2]^3 ;
  1 x[3] x[3]^2 x[3]^3 ;
  1 x[4] x[4]^2 x[4]^3 ]

p(x, y) = P(x) \ y

a = p(metros, temp)

f(x) = a[1] + a[2]*x + a[3]*x^2 + a[4]*x^3

println("Questão 1")
println("Resultado para as novas serpentinas:")
println(round(f(novas_serpentinas[1]), digits=2))
println(round(f(novas_serpentinas[2]), digits=2))
println(round(f(novas_serpentinas[3]), digits=2))
println(round(f(novas_serpentinas[4]), digits=2))

# 2 - Suponha que você tenha um circuito RL em série com uma fonte de tensão constante V, resistência R e indutância L. A corrente I(t) é medida nos seguintes instantes de tempo:

t = [0.2 ; 0.5 ; 0.7 ; 1.0]
i = [0.8187 ; 1.5815 ; 1.9354 ; 2.2905]

# Estime a corrente nos tempos t = 0.3s e t = 0.9s.

# Sugestão: usar o método da interpolação polinomial.
# Resposta aproximada: I(0.3) = 1.107639A e I(0.9) = 2.19182A

P(x) = [1 t[1] t[1]^2 t[1]^3 ;
  1 t[2] t[2]^2 t[2]^3 ;
  1 t[3] t[3]^2 t[3]^3 ;
  1 t[4] t[4]^2 t[4]^3 ]

p(x, y) = P(x) \ y

a = p(t, i)

f(x) = a[1] + a[2]*x + a[3]*x^2 + a[4]*x^3

println("Questão 2")
println("Resultado para os tempos 0.3s e 0.9s:")
println(round(f(0.3), digits=5))
println(round(f(0.9), digits=5))

# 3 - Uma fábrica de chuveiros tem um modelo especial com quatros modos de temperatura (verão, outono, inverno, primavera), que variam devido a diferentes resistências.

# Encontre o modelo matemático linear:

# f(x)=a2x+a1

# De cada resistência, sendo x em cm e f(x) em graus celsius, dado que alguns valores foram medidos experimentalmente (o modelo verão não usa resistência).

# A tabela abaixo contém a matriz com as medições de temperatura na primeira linha e os centímetros das resistências na segunda linha.

# Encontre os valores de a1 e a2 de cada resistência.

# Outono
temp_outono = [38.0 ; 40.0 ; 42.0 ; 44.0 ; 46.0]
cent_outono = [1.0 ; 1.25 ; 1.5 ; 1.75 ; 2.0]

temp_inverno = [40.0 ; 44.0 ; 48.0 ; 52.0 ; 56.0]
cent_inverno = [1.0 ; 1.5 ; 2 ; 2.5 ; 3.0]

temp_primavera = [36.0 ; 39.0 ; 42.0 ; 45.0 ; 48.0]
cent_primavera = [1.0 ; 1.15 ; 1.3 ; 1.45 ; 1.6]
# Sugestão: usar o método de quadrados mínimos.

function trinv(v, x, y)
    V = v(x)
    Vt = transpose(V)
    res = inv(Vt*V)*(Vt*y)
    return res
  end

v_outono(x) = [ 
        1 x[1];
        1 x[2];
        1 x[3];
        1 x[4];
        1 x[5];
        ]

v_inverno(x) = [
        1 x[1];
        1 x[2];
        1 x[3];
        1 x[4];
        1 x[5];
        ]

v_primavera(x) = [
        1 x[1];
        1 x[2];
        1 x[3];
        1 x[4];
        1 x[5];
        ]

r_o = trinv(v_outono, cent_outono, temp_outono)
r_i = trinv(v_inverno, cent_inverno, temp_inverno)
r_p = trinv(v_primavera, cent_primavera, temp_primavera)

r_outono = round(r_o[1]), round(r_o[2])
r_inverno = round(r_i[1]), round(r_i[2])
r_primavera = round(r_p[1]), round(r_p[2])

println("Questão 3")
println("Resultado para o outono:")
println(r_outono)

println("Resultado para o inverno:")
println(r_inverno)

println("Resultado para a primavera:")
println(r_primavera)

# 4 - Um conversor de potência DC-DC foi testado em várias condições de carga. Para cada condição, foram medidos valores da tensão V e da corrente I. Como parte da análise do sistema, deseja-se determinar a resistência equivalente Req.

#  V=ReqI+b

# b é uma constante de ajuste.

# Os dados de medição são:
v = [5.1, 10.3, 15.2, 20.1, 24.7, 30.5]
i = [0.5, 1.1, 1.5, 2.2, 2.5, 3.1]

# Estime Req e b.

# Sugestão: usar o método de quadrados mínimos.

Reqb(x) = [ 
        1 x[1];
        1 x[2];
        1 x[3];
        1 x[4];
        1 x[5];
        1 x[6];
        ]
    
r_reqb = trinv(Reqb, i, v)

println("Questão 4")
println("Req: ", r_reqb[2])
println("b: ", r_reqb[1])

# 5 - Considere um circuito RL em série com um resistor R e um indutor L, onde a corrente I(t) varia ao longo do tempo em resposta a uma fonte de tensão variável V(t). A relação entre a tensão, corrente, resistência e indutância é dada por:

# V(t)=L*d(I(t))/dt​+R*I(t)

# onde:
R = 5 #Ω
L = 0.1 #H

# As medições de corrente I(t) foram feitas nos seguintes instantes:

t = [0.0, 0.1, 0.2, 0.3, 0.4]
i = [0.0, 0.82, 1.36, 1.60, 1.73]

# Sabendo que a corrente está crescendo em função linear do tempo (ajuste), estime a tensão V no instante t = 0.5s

# Sugestão: usar o método da diferença finita progressiva.
dp(f,x,h) = (f(x+h)-f(x))/h

# Achar I(t)
P(x) = [
    1 x[1];
    1 x[2];
    1 x[3];
    1 x[4];
    1 x[5];
]

coef = trinv(P, t, i)

I(x) = coef[1] + coef[2]*x

V(x) = L*dp(I, x, 1e-5) + R*I(x)

println("Questão 5")
println("Resultado para o instante t = 0.5s:")
println(trunc(V(0.5), digits=5))

# 6 - Refaça a tarefa anterior, sabendo que a corrente está crescendo em função quadrática do tempo.
# Sugestão: usar o método da diferença finita regressiva.
dr(f,x,h) = (f(x)-f(x-h))/h

# Achar I(t) com tempo quadrático
P(x) = [
    1 x[1] x[1]^2;
    1 x[2] x[2]^2;
    1 x[3] x[3]^2;
    1 x[4] x[4]^2;
    1 x[5] x[5]^2;
]

coef = trinv(P, t, i)

I(x) = coef[1] + coef[2]*x + coef[3]*x^2

V(x) = L*dr(I, x, 1e-5) + R*I(x)

println("Questão 6")
println("Resultado para o instante t = 0.5s:")
println(trunc(V(0.5), digits=5))

#7 - Refaça a tarefa anterior, sabendo que a corrente está crescendo em função cúbica do tempo.

#Sugestão: usar o método da diferença finita central.
dc(f,x,h) = (f(x+h)-f(x-h))/(2*h)

# Achar I(t) com tempo cúbico
P(x) = [
    1 x[1] x[1]^2 x[1]^3;
    1 x[2] x[2]^2 x[2]^3;
    1 x[3] x[3]^2 x[3]^3;
    1 x[4] x[4]^2 x[4]^3;
    1 x[5] x[5]^2 x[5]^3;
]

coef = trinv(P, t, i)

I(x) = coef[1] + coef[2]*x + coef[3]*x^2 + coef[4]*x^3

V(x) = L*dc(I, x, 1e-5) + R*I(x)

println("Questão 7")
println("Resultado para o instante t = 0.5s:")
println(trunc(V(0.5), digits=5))

# 8 - Uma empresa de saneamento pública realiza o cálculo de micro drenagem das ruas por meio da pluviosidade das águas de chuva em função do raio da manilha, dado pela fórmula:

# P(r)=3(1−r/4)^1/7

# É necessário saber a quantidade de água de chuva por segundo suportada por cada manilha, dado pela fórmula:

# Q(r)=2π∫r*P(r)dr

# A tabela abaixo contém o valor do raio. Encontre a quantidade de água de chuva por segundo suportada por cada manilha.

raio = [1.25; 2.55; 3.15; 3.95]

# Sugestão: usar o método das regras de quadratura pelo ponto médio.
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

function pontomedio(f, a, b)
    h = b - a
    return h*(f((a+b)/2))
  end

P(x) = 3*(1-x/4)^(1/7)
rP(x) = x*P(x)
Q(x) = 2*π*integracao(rP, pontomedio, 0, x, 1e-5)

println("Questão 8")
println("Resultado para a quantidade de água de chuva por segundo suportada por cada manilha:")
println("1.25: ", Q(raio[1]))
println("2.55: ", Q(raio[2]))
println("3.15: ", Q(raio[3]))
println("3.95: ", Q(raio[4]))

# 9 - Refaça a tarefa anterior, pela regra do trapézio.
function trapezio(f, a, b)
    h = b - a
    return h*(((1/2)*f(a))+((1/2)*f(b)))
  end

Q(x) = 2*π*integracao(rP, trapezio, 0, x, 1e-5)

println("Questão 9")
println("Resultado para a quantidade de água de chuva por segundo suportada por cada manilha:")
println("1.25: ", Q(raio[1]))
println("2.55: ", Q(raio[2]))
println("3.15: ", Q(raio[3]))
println("3.95: ", Q(raio[4]))

# 10 - Refaça a tarefa anterior, pela regra de Simpson.
function simpson(f, a, b)
    h = (b - a) / 2
    return h*(((1/3)*f(a))+((4/3)*f((a+b)/2))+((1/3)*f(b)))
  end

Q(x) = 2*π*integracao(rP, simpson, 0, x, 1e-5)

println("Questão 10")
println("Resultado para a quantidade de água de chuva por segundo suportada por cada manilha:")
println("1.25: ", Q(raio[1]))
println("2.55: ", Q(raio[2]))
println("3.15: ", Q(raio[3]))
println("3.95: ", Q(raio[4]))

