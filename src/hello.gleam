import gleam/string
import gleam/io
import gleam/function
import gleam/result

pub fn greeting() {
  "Hello, from gleam!"
}

pub fn switch(greeting: String) -> String {
  string.reverse(greeting)
}


pub external fn read_file_nif(path: String) -> Result(String, function.Exception) = "Elixir.RustFFI" "read_file"

pub fn read_file_safe(path: String) -> Result(String, function.Exception) {
    let some_func = fn() { read_file_nif(path) }
    let result : Result(Result(String, function.Exception), function.Exception) = function.rescue(some_func)
    case result {
        Ok(content) -> {
            Ok(result.unwrap(content, "Should not happen"))
        }
        Error(error) -> {
            Error(error)
        }
    }
}

pub fn read_file_with_gleam(path: String) {
    let read_file_result = read_file_safe(path)

    io.println("method called")

    case read_file_result {
        Ok(content) -> {
            io.println("read file success")
            io.print(content)
        }
        Error(error) -> {
            io.println("read file error")
            io.debug(error)
            Nil
        }
    }
}