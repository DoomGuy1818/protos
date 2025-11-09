PROTOBUF_PATH=proto/sso/sso.proto
OUTPUT_PATH=./gen/go

PROTOC_GEN_GO=$(shell which protoc-gen-go)
PROTOC_GEN_GO_GRPC=$(shell which protoc-gen-go-grpc)

generate:
	protoc -I proto ${PROTOBUF_PATH}\
 	--go_out=${OUTPUT_PATH}\
 	--go_opt=paths=source_relative\
 	--go-grpc_out=${OUTPUT_PATH}\
 	--go-grpc_opt=paths=source_relative

check:
	@if [ -z "$(PROTOC_GEN_GO)" ]; then echo "❌ protoc-gen-go not found! Run: go install google.golang.org/protobuf/cmd/protoc-gen-go@latest"; exit 1; fi
	@if [ -z "$(PROTOC_GEN_GO_GRPC)" ]; then echo "❌ protoc-gen-go-grpc not found! Run: go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest"; exit 1; fi

clean:
	rm -rf $(OUTPUT_PATH)