FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod .
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o codhoot-cpp-service .

FROM alpine:3.19
RUN apk add --no-cache g++ libc-dev make
WORKDIR /app
COPY --from=builder /app/codhoot-cpp-service .
ENV PORT=8081
EXPOSE 8081
CMD ["./codhoot-cpp-service"]
