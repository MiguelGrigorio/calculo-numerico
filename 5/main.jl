using LinearAlgebra

A = [1 1 1;
     4 4 2;
     2 1 -1]

B = [1 ; 2 ; 0]

x = A \ B
#println(x)

function jacobi(A, B, k, error)
  n = size(B,1)
  X = zeros(n)
  K = zeros(n)
  for l = 1:k
    for i = 1:n
      count = 0
      for j = 1:n
        if i != j
          count += A[i,j]*X[j]
        end
      end
      K[i] = (B[i]-count)/A[i,i]
    end
    if norm(X-K) < error
      break
    end
    X = copy(K)
  end
  return X
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

error = 10^-3

x = jacobi(A,B,100,error)

#println(x)

#Exercício 4.7.2

A = [5 1 1;
     -1 3 -1;
     1 2 10]

B = [50 ; 10 ; -30]

error = 10^-3

println("Exercício 4.7.2")
println("Jacobi: ", jacobi(A,B,100,error))
println("Seidel: ", seidel(A,B,100,error))

#Exercício 4.7.3
  #Exercício 4.1.1

A = [1 1 1;
     1 0 10;
     0 10 1]

B = [0 ; -48 ; 25]

#Organizando
A = [1 1 1;
     0 10 1;
     1 0 10]

B = [0 ; 25 ; -48]

error = 10^-3

println("Exercício 4.7.3")
println("Jacobi: ", jacobi(A,B,100,error))
println("Seidel: ", seidel(A,B,100,error))

#Exercício 4.7.5

A = [1 10 3;
     4 0 1;
     2 1 4]

B = [27 ; 6; 12]

#Organizando

A = [4 0 1;
     1 10 3;
     2 1 4]

B = [6 ; 27 ; 12]

error = 10^-3
println("Exercício 4.7.5")
println("Jacobi: ", jacobi(A,B,100,error))
println("Seidel: ", seidel(A,B,100,error))