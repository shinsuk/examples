# SwiftWasm

[Documentation](https://book.swiftwasm.org/index.html)

### Create a Swift file

```sh
echo 'print("Hello, world!")' > hello.swift
```

### Compile Swift code into WebAssembly with WASI

```sh
xcrun --toolchain swiftwasm swiftc -target wasm32-unknown-wasi hello.swift -o hello.wasm
```

### Run the produced binary on WebAssembly runtime

```sh
wasmer hello.wasm
```
