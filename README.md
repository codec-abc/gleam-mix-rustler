Project based on [ElixirWithGleam](https://github.com/midas-framework/elixir_with_gleam) to add Rustler on top of it.

To compile run

````sh
curl https://sh.rustup.rs -sSf | sh # (Proceed with default install)
mix deps.get
mix compile
````

Then to run

````sh
iex -S mix
ElixirWithGleam.hello()
RustFFI.add(2, 3)
````