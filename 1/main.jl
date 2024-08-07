function fx(x, a, b, c)
	y(n) = a*n^2 + b*n + c
	return y(x)
end

function zeros(a, b, c)
	if a != 0
		delta = b^2 - 4*a*c
		if delta < 0
			println("Não há raízes reais")	
		else
			x1 = (-b + sqrt(delta)) / (2*a)
			x2 = (-b - sqrt(delta)) / (2*a)
			return x1, x2
		end
	else
		if b !=0
			return -c/b
		else
			println("Não é uma função")
		end
	end
end