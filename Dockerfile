FROM golang:1.10.3-stretch as build_img
COPY main.go .
RUN go build -o /code main.go

FROM l.gcr.io/google/debian9:latest
COPY --from=build_img /code .
ENTRYPOINT ["./code"]
