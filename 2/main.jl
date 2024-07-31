function e(x)
    ans = 0
    for i in 0:57
        ans += x^i/factorial(big(i))
    end
    return ans
end