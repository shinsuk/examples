# Makefile for SwiftWasm

SDKROOT=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/share/wasi-sysroot

.PHONY: all create compile run

all: run

create:
	echo 'print("Hello, world!")' > hello.swift

compile: create
	xcrun --toolchain swiftwasm swiftc -target wasm32-unknown-wasi -sdk ${SDKROOT} hello.swift -o hello.wasm


run: compile
	wasmer hello.wasm
