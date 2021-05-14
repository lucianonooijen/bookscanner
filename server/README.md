# Book server

- Must use Rust nightly for Rocket.rs to work

## Usage

Use `ROCKET_ENV=staging cargo run` for running the server on port 8000 and allow requests outside of localhost, without setting `ROCKET_ENV` calls from the app will be blocked
