use actix_web::{get, App, HttpResponse, HttpServer, Responder};

use serde::Serialize;

#[derive(Serialize)]
struct Resp {
    msg: String,
}

#[get("/hello")]
async fn hello() -> impl Responder {
    let obj = Resp {
        msg: "hello docker".to_string(),
    };
    HttpResponse::Ok().json(obj)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}