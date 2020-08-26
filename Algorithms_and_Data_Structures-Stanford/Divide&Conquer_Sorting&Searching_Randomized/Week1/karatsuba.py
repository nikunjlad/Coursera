def karatsuba(x, y):
    """Function to multiply 2 numbers in a more efficient manner than the grade school algorithm"""
    print(x, y)
    if len(str(x)) == 1 or len(str(y)) == 1:
        return x * y
    else:
        n = max(len(str(x)), len(str(y)))
        nby2 = int(n / 2)

        a = int(x / 10 ** (nby2))
        b = int(x % 10 ** (nby2))
        c = int(y / 10 ** (nby2))
        d = int(y % 10 ** (nby2))

        ac = karatsuba(a, c)
        bd = karatsuba(b, d)
        ad_plus_bc = karatsuba(a + b, c + d) - ac - bd

        # this little trick, writing n as 2*nby2 takes care of both even and odd n
        prod = ac * 10 ** (2 * nby2) + (ad_plus_bc * 10 ** nby2) + bd

        return prod

# def dyna_karatsuba(n):
#     memo = [None] * (36)
#     x = 3141592653589793238462643383279502884197169399375105820974944592
#     y = 271828182845904523536028747135266249775724709369995957496696762
#     return karatsuba(x, y, memo)

print(karatsuba(3141592653589793238462643383279502884197169399375105820974944592,
                2718281828459045235360287471352662497757247093699959574966967627))

# print("Answer", karatsuba(1234,5678))

# dynamic programming approach to solving the mutliplication problem using karatsuba

product = list()



