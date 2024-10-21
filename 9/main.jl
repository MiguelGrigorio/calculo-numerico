using LinearAlgebra

function trinv(v, x, y)
  V = v(x)
  Vt = transpose(V)
  res = inv(Vt*V)*(Vt*y)
  return res
end

# Exemplo 7.1.2
v(x) = [ 
        1 x[1];
        1 x[2];
        1 x[3];
        1 x[4];
        ]

x = [-0.35; 0.15; 0.23; 0.35]
y = [0.2; -0.5; 0.54; 0.7]

r = trinv(v, x, y)
println(r)

# Exercicio 7.2.3
x = [0.0; 0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1.0]
y = [31; 35; 37; 33; 28; 20; 16; 15; 18; 23; 31]

# a)
v_a(x) = [ 
        1 sin(2*π*x[1]) cos(2*π*x[1]);
        1 sin(2*π*x[2]) cos(2*π*x[2]);
        1 sin(2*π*x[3]) cos(2*π*x[3]);
        1 sin(2*π*x[4]) cos(2*π*x[4]);
        1 sin(2*π*x[5]) cos(2*π*x[5]);
        1 sin(2*π*x[6]) cos(2*π*x[6]);
        1 sin(2*π*x[7]) cos(2*π*x[7]);
        1 sin(2*π*x[8]) cos(2*π*x[8]);
        1 sin(2*π*x[9]) cos(2*π*x[9]);
        1 sin(2*π*x[10]) cos(2*π*x[10]);
        1 sin(2*π*x[11]) cos(2*π*x[11]);
        ]

r = trinv(v_a, x, y)
println(r)

# b)
v_b(x) = [ 
        1 x[1] x[1]^2 x[1]^3;
        1 x[2] x[2]^2 x[2]^3;
        1 x[3] x[3]^2 x[3]^3;
        1 x[4] x[4]^2 x[4]^3;
        1 x[5] x[5]^2 x[5]^3;
        1 x[6] x[6]^2 x[6]^3;
        1 x[7] x[7]^2 x[7]^3;
        1 x[8] x[8]^2 x[8]^3;
        1 x[9] x[9]^2 x[9]^3;
        1 x[10] x[10]^2 x[10]^3;
        1 x[11] x[11]^2 x[11]^3;]

r = trinv(v_b, x, y)
println(r)