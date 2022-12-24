FROM golang:alpine AS builder
WORKDIR /home/Desktop/hello_world_GO
ADD go.mod .
COPY . .
RUN go build -o hello hello.go

FROM alpine
WORKDIR /home/Desktop/hello_world_GO
COPY --from=builder /home/Desktop/hello_world_GO/hello /home/Desktop/hello_world_GO/hello
CMD ["./hello"]
