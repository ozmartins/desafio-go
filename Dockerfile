FROM golang AS build-stage
WORKDIR /app
COPY desafio.go .
RUN go build desafio.go

FROM scratch
WORKDIR /app
COPY --from=build-stage /app/desafio .
ENTRYPOINT [ "./desafio" ]