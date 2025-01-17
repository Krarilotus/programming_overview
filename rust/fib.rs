// fib.rs
//
// Kompilieren: rustc fib.rs -o fib
// Ausführen:   ./fib
//
// Zeigt, wie man in Rust Traits nutzt, um verschiedene Implementierungen
// der Fibonacci-Berechnung (rekursiv vs. iterativ) auszutauschen.

use std::io;

// Ein Trait "FibCalc" fungiert wie ein Interface:
// Wer dieses Trait implementiert, muss eine fib()-Methode anbieten.
trait FibCalc {
    fn fib(&self, n: u32) -> u32;
}

// Zwei Strukturen, die das Trait unterschiedlich implementieren:
struct RecFib;  // rekursiv
struct IterFib; // iterativ

impl FibCalc for RecFib {
    fn fib(&self, n: u32) -> u32 {
        if n <= 1 {
            n
        } else {
            self.fib(n - 1) + self.fib(n - 2)
        }
    }
}

impl FibCalc for IterFib {
    fn fib(&self, n: u32) -> u32 {
        if n <= 1 {
            return n;
        }
        let (mut a, mut b) = (0, 1);
        for _ in 2..=n {
            let temp = a + b;
            a = b;
            b = temp;
        }
        b
    }
}

fn main() {
    println!("Gib eine Zahl n ein:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: u32 = input.trim().parse().unwrap();

    let recursive_calc = RecFib;
    let iterative_calc = IterFib;

    println!("IterFib: fib({}) = {}", n, iterative_calc.fib(n));
    println!("RecFib: fib({}) = {}", n, recursive_calc.fib(n));
}
