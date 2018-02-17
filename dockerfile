FROM golang:1.8.3 as builder
WORKDIR /go/src/wolves-aywe
COPY wolves-aywe.go  .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o wolves-aywe .

FROM alpine:latest
#RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/wolves-aywe/wolves-aywe .
ENTRYPOINT ["./wolves-aywe"]
EXPOSE 8888