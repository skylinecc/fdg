#!/bin/sh
rm -rf public/*

rustup target add wasm32-unknown-unknown

cd fdg-macroquad && cargo build --release --target wasm32-unknown-unknown --examples && cd ..
cp target/wasm32-unknown-unknown/release/examples/* ./public/
cp fdg-macroquad/examples/web-examples/* ./public/

cd fdg-wasm && make && cd ..

mkdir -p ./public/wasmapi/
cp -rf fdg-wasm/examples/* ./public/wasmapi/

cd fdg-img/examples/web/ && make && cd ../../../

mkdir -p ./public/fdg-img/
cp -rf fdg-img/examples/web/* ./public/fdg-img/


# remove gitignores
rm -rf public/.gitignore
rm -rf public/wasmapi/pkg/.gitignore
rm -rf public/fdg-img/pkg/.gitignore