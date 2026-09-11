FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    libc6-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY codhoot-cpp-service .

ENV PORT=8081
EXPOSE 8081

CMD ["./codhoot-cpp-service"]
