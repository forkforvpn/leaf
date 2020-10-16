cross:
	docker build -t custom/cross:$(target) - < docker/Dockerfile.$(target)
	cross build --target $(target) -p leaf-bin --release

ios:
	cargo lipo -p leaf-mobile --release --targets aarch64-apple-ios && cp target/universal/release/libleaf.a /tmp/ && cbindgen leaf-mobile/src/lib.rs -l c > /tmp/leaf.h

ios-dev:
	cargo lipo -p leaf-mobile --targets aarch64-apple-ios && cp target/universal/debug/libleaf.a /tmp/ && cbindgen leaf-mobile/src/lib.rs -l c > /tmp/leaf.h

local:
	cargo build -p leaf-bin --release

local-dev:
	cargo build -p leaf-bin
