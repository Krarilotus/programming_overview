/*
  fib.cpp
  Minimalbeispiel zur Fibonacci-Berechnung in C++.
  Microsoft Visual C++ Compiler (MSVC) oder MinGW/Clang.
*/

#include <iostream>

int fib_rec(int n) {
    if (n <= 1) return n;
    return fib_rec(n - 1) + fib_rec(n - 2);
}

int fib_iter(int n) {
    if (n <= 1) return n;
    int a = 0, b = 1;
    for (int i = 2; i <= n; ++i) {
        int temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

int main() {
    int n;
    std::cout << "Gib n ein: ";
    std::cin >> n;

    std::cout << "Fibonacci iterativ(" << n << ") = " << fib_iter(n) << std::endl;
    std::cout << "Fibonacci rekursiv(" << n << ") = " << fib_rec(n) << std::endl;
    return 0;
}
