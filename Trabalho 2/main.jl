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

# Sugestão: usar o método de quadrados mínimos.

P(x) = [1 cent_outono[1] ;
  1 cent_outono[2] ;
  1 cent_outono[3] ;
  1 cent_outono[4] ;
  1 cent_outono[5] ]

p(x, y) = P(x) \ y

a = p(cent_outono, temp_outono)

f(x) = a[1] + a[2]*x

println("Resultado para o outono:")
println(round(f(1.0), digits=2))