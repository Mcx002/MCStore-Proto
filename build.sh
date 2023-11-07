#!/bin/bash

OUTPUT_DIR=./proto_gen

# Check if the folder exists
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir $OUTPUT_DIR
fi

# Generate Javascript code
npx grpc_tools_node_protoc \
  --js_out=import_style=commonjs,binary:${OUTPUT_DIR} \
  --grpc_out=grpc_js:${OUTPUT_DIR} \
  --plugin=protoc-gen-grpc=./node_modules/.bin/grpc_tools_node_protoc_plugin \
  -I ./proto \
  proto/*.proto

# Generate Typescript code (d.ts)
npx grpc_tools_node_protoc \
  --ts_out=grpc_js:${OUTPUT_DIR} \
  --plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts \
  -I ./proto \
  proto/*.proto
