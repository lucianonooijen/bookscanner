#![feature(proc_macro_hygiene, decl_macro)]
#[macro_use] extern crate rocket;

use rocket::{post, routes};
use rocket::http::Status;
use std::process::Command;

mod book;
mod storage;

fn play_confirm_sound() {
    Command::new("bash").arg("-c").arg("echo -e '\\a'").spawn().expect("error playing sound");
}

#[post("/book", data = "<book>")]
fn new_book(book: String) -> Status {
    println!("{}", book);
    let b: book::Book = match serde_json::from_str(&book) {
        Ok(b_json) => b_json,
        Err(e) => {
            println!("Error getting book JSON: {}", e);
            return Status::InternalServerError;
        }
    };
    println!("{:?}", b);

    let mut s = storage::Storage::new();
    s.add_book(b);

    play_confirm_sound();

    Status::Created
}


#[get("/")]
fn index() -> &'static str {
    "Hello, world!"
}

// Note: only supports one call at a time
fn main() {
    rocket::ignite()
        .mount("/", routes![index, new_book])
        .launch();
}
