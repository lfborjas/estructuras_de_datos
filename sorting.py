from random import randint as rand

ary = [rand(1, 100) for i in range(10)]

n = len(ary) - 1

for i in range(1, n):
    for j in range(n, i-1, -1):
        if ary[j-1] > ary[j]:
            ary[j-1], ary[j] = ary[j], ary[j-1]

for element in ary:
    print element



