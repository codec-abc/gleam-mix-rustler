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


pub external fn read_file_nif(path: String) -> Result(String, String) = "Elixir.RustFFI" "read_file"

pub fn read_file_safe(path: String) -> Result(String, String) {
    let result = read_file_nif(path)
    result
}

pub fn read_file_with_gleam(path: String) {
    let read_file_result = read_file_safe(path)

    io.println("method called")

    case read_file_result {
        Ok(content) -> {
            io.println("read file success")
            io.println(content)
        }
        Error(error) -> {
            io.println("read file error")
            io.println(error)
            Nil
        }
    }
}