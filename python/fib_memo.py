# fib_memo.py

memo = {}  # Dictionary für Zwischenspeicher

def fib_memo(n):
    """Fibonacci rekursiv, aber mit Memoization in einem Dictionary."""
    if n <= 1:
        return n
    if n in memo:
        return memo[n]

    result = fib_memo(n - 1) + fib_memo(n - 2)
    memo[n] = result  # im Dictionary zwischenspeichern
    return result

if __name__ == "__main__":
    n = int(input("Gib n ein: "))
    print(f"Fibonacci von {n} ist: {fib_memo(n)}")
    print("Memo-Dictionary:", memo)
