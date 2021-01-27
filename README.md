Project based on [ElixirWithGleam](https://github.com/midas-framework/elixir_with_gleam) to add Rustler on top of it.

To compile run

````sh
curl https://sh.rustup.rs -sSf | sh # (Proceed with default install)
mix deps.get
mix compile
````

Then to run

````elixir
iex -S mix
ElixirWithGleam.hello()
:hello.greeting()
RustFFI.add(2, 3)
RustFFI.read_file("README.md")
:hello.read_file_with_gleam("README.md")
````