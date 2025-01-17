# Projekt: Demonstration verschiedener Programmiersprachen

In diesem Repository findest du **Minimalbeispiele** für diverse Programmiersprachen (Assembly, C++, Rust, Python, Haskell, Prolog, JavaScript/HTML/CSS/React), jeweils mit einer **Fibonacci-Funktion** als zentrales Beispiel. Dazu kommen Anleitungen, wie du die Beispiele in **VS Code** zum Laufen bekommst.

---

## Inhaltsverzeichnis

- [Projekt: Demonstration verschiedener Programmiersprachen](#projekt-demonstration-verschiedener-programmiersprachen)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [Voraussetzungen](#voraussetzungen)
  - [Empfohlene VS-Code-Extensions](#empfohlene-vs-code-extensions)
  - [Use git:](#use-git)

---

## Voraussetzungen

1. **VS Code**  
   - Download: <https://code.visualstudio.com/>

2. **Git**  
   - Download: <https://git-scm.com/downloads>

3. **Compiler / Interpreter** für die jeweiligen Sprachen:

   - **Assembly**  
     - NASM (Netwide Assembler) – Download: <https://www.nasm.us/>  
     - Linker wie `ld` (unter Linux in den Binutils),  
     - Unter Windows: [WSL](https://learn.microsoft.com/de-de/windows/wsl/install) oder [MSYS2](https://www.msys2.org/) oder **MASM/TASM** als Alternative.  

   - **C++**  
     - Microsoft Visual C++ (MSVC, Windows), oder  
     - GCC / Clang (z. B. MinGW oder WSL auf Windows, direkt auf Linux/Mac).  
     - Info: <https://isocpp.org/get-started>  

   - **Rust**  
     - `rustup` installieren: <https://rustup.rs/>  
     - Danach hast du `cargo` (Package-Manager) und `rustc` (Compiler).  

   - **Python**  
     - <https://www.python.org/downloads/> (3.7+).  

   - **Haskell**  
     - GHCup als Komplettpaket: <https://www.haskell.org/ghcup/>  
     - Oder direkt GHC (Glasgow Haskell Compiler) / Stack/Cabal: <https://www.haskell.org/ghc/>  

   - **Prolog**  
     - SWI-Prolog: <https://www.swi-prolog.org/>  

   - **Node.js** (für JavaScript/React)  
     - <https://nodejs.org/en/download>  
     - Ab Version 16 (LTS) oder neuer.  
     - Enthält **npm** (Node Package Manager) automatisch.
     - im backend wird `npm install` und `npm start`

4. **Optional**  
   - **CMake** für C++/Rust-Builds.  
   - **Docker** (falls du Container-Setups machen willst).

---

## Empfohlene VS-Code-Extensions

1. **C/C++**  
   - [ms-vscode.cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

2. **Rust**  
   - [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)

3. **Python**  
   - [ms-python.python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)

4. **Haskell**  
   - [haskell.haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell)

5. **Prolog**  
   - [SWI-Prolog (JanScharold.swi-prolog)](https://marketplace.visualstudio.com/items?itemName=JanScharold.swi-prolog)  
   oder  
   - [Prolog (arthurwang.vsc-prolog)](https://marketplace.visualstudio.com/items?itemName=arthurwang.vsc-prolog)

6. **JavaScript/TypeScript**  
   - (teilweise schon integriert in VS Code)  
   - [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)  
   - [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

7. **GitLens** (optional, aber sehr nützlich)  
   - [eamodio.gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

8. **Remote - WSL**  
   - [ms-vscode-remote.remote-wsl](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)

9. **Live Server**  
   - [ritwickdey.LiveServer](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)  
   - Für schnelle HTML-Preview (optional).

---

## Use git:
um git zu nutzen, klone dein repo zunächst mit:
`git clone <repolink>`

Um dann deine Änderungen hochzuladen machst die die folgenden drei befehle:
`git add .`
`git commit -m "commitmessage"`
`git push`

Bevor du nochwas änderst immer einmal die änderungen vom remote runterziehen:
`git pull`