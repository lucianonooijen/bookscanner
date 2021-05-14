use std::fs;

use crate::book;

pub struct Storage {
    filename: String,
    books: Vec<book::Book>,
}

impl Storage {
    pub fn new() -> Self {
        Storage{
            filename: String::from("./books.json"),
            books: Vec::new(),
        }
    }

    pub fn load_from_disk(mut self: Self) {
        // Load file from disk
        let data = fs::read_to_string(self.filename).expect("could not read file");

        // Deserialize JSON
        let books = serde_json::from_str(&data).expect("could not deserialize json books file");
        self.books = books;
    }

    pub fn add_book(mut self: Self, book: book::Book) {
        // Add book to storage
        self.books.push(book);

        // Serialize to JSON and save to disk
        let json = serde_json::to_string_pretty(&self.books).expect("could not serialize self.books");
        fs::write(self.filename, json).expect("could not write json");

        // TODO: Reload file contents to struct to be sure we're up to date
        // Err: error[E0382]: use of partially moved value: `self`
        // note: partial move occurs because `self.filename` has type `std::string::String`, which does not implement the `Copy` trait
        // self.load_from_disk();
    }
}
