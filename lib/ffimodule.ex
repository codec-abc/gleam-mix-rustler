defmodule RustFFI do
  @moduledoc """
  Documentation for `ElixirWithGleam`.
  """
  
  use Rustler, otp_app: :elixir_with_gleam, crate: :rustffi

  def add(_arg1, _arg2), do: :erlang.nif_error(:nif_not_loaded)
end
