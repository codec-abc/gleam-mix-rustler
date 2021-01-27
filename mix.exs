defmodule ElixirWithGleam.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_with_gleam,
      version: "0.1.0",
      elixir: "~> 1.10",
      erlc_paths: ["src", "gen"],
      compilers: [:gleam] ++ [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end
  
  defp rustc_mode(:prod), do: :release
  defp rustc_mode(_), do: :debug
  
  defp rustler_crates do
    [io: [
      path: "native/rustffi",
      mode: rustc_mode(Mix.env)
    ]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_gleam, "~> 0.1.0"},
      {:gleam_stdlib, "~> 0.9.0"},
      {:rustler, "~> 0.21.1"}
      # {:gleam_stdlib, path: "./stdlib"}
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
