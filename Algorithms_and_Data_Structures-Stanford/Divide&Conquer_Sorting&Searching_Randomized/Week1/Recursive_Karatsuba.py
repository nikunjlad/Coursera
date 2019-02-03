"""
Created by -
@author nikunj on 12/6/18

"""

# Karatsuba formula: (10^n)ac  + (10^n/2)(ad + bc) + bd
# ad + bc = (a + b)(c + d) - ac - bd
# eg of karatsuba approach:
#
# numbers are x = 2345, y = 8675, so we first find max length, in this case it is 4
# therefore, a = 23, b = 45, c = 86 and d = 75, i.e. we split the number into half and decomposed it into 4 parts
# now we decompose these parts too, till either of the number is of a single digit.

from math import ceil


def karatsuba(x, y):
    """

    :param x:  first number of even or odd length, need not necessarily be of the same length as the next one.
    :param y: second number of even or odd length, need not necessarily be of same length as previous one.
    :return: product of the two numbers provided above.
    """
    if len(str(x)) == 1 or len(str(y)) == 1: # if any one of the number is a single digit, then just multiply and return the result
        return x * y
    else:

        max_digits = max(len(str(x)), len(str(y))) # of the two numbers supplied by the user, find the one which has max number of digits
        split_point = ceil(max_digits / 2) # split the above given number into half and take the ceil in case of an odd number

        a = int(x / 10 ** split_point)  # 234 / 100 is 2.34 which rounds down to 2 because of int
        b = int(x % 10 ** split_point) # 234 % 100 gives the remainder i.e 34
        c = int(y / 10 ** split_point) # similarly, 34 / 100 gives 0.34 which rounds down to 0
        d = int(y % 10 ** split_point) # 34 % 100 gives remainder 34

        ac = karatsuba(a, c) # here we pass in 2 and 0, can't be decomposed since either of them is already a single digit number
        bd = karatsuba(b, d) # here we pass in 34 and 34, both of them will be further decomposed recursively
        ad_plus_bc = karatsuba((a + b), (c + d)) - ac - bd # we calculate the middle term of the before mentioned formula

        prod = int((10 ** max_digits) * ac + (10 ** split_point) * ad_plus_bc + bd) # having found the 3 products recursively, we compute the product with some elementary math

        return prod


# acquire inputs from user to be multiplied and display the result
number1 = int(input("Enter a number: ")) # let number be 234
number2 = int(input("Enter another number: ")) # let this one be 34
result = karatsuba(number1, number2)
print("Product is: %d" % result)
