use rustler::{Encoder, Env, Error, Term};
use std::fs;

mod atoms {
    rustler::rustler_atoms! {
        atom ok;
        atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler::rustler_export_nifs! {
    "Elixir.RustFFI",
    [
        ("add", 2, add),
        ("read_file", 1, read_file)
    ],
    None
}

fn add<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let num1: i64 = args[0].decode()?;
    let num2: i64 = args[1].decode()?;

    Ok((atoms::ok(), num1 + num2).encode(env))
}


fn read_file<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let path: String = args[0].decode()?;
    let result: Result<String, std::io::Error> = fs::read_to_string(path);
    match result {
        Ok(content) => {
            Ok((atoms::ok(), content).encode(env))
        }
        Err(_error) => {
            Err(Error::BadArg)
        }
    }
    
}