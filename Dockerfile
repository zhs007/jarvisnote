FROM golang:1.10 as builder

MAINTAINER zerro "zerrozhao@gmail.com"

WORKDIR $GOPATH/src/github.com/zhs007/jarvisnote

COPY ./Gopkg.* $GOPATH/src/github.com/zhs007/jarvisnote/

RUN go get -u github.com/golang/dep/cmd/dep \
    && dep ensure -vendor-only -v

COPY . $GOPATH/src/github.com/zhs007/jarvisnote

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o jarvisnote . \
    && mkdir /home/jarvisnote \
    && mkdir /home/jarvisnote/cfg \
    && mkdir /home/jarvisnote/dat \
    && mkdir /home/jarvisnote/logs \
    && cp ./jarvisnote /home/jarvisnote/ \
    && cp ./cfg/config.yaml.default /home/jarvisnote/cfg/config.yaml

FROM alpine
RUN apk upgrade && apk add --no-cache ca-certificates
WORKDIR /home/jarvisnote
COPY --from=builder /usr/local/go/lib/time/zoneinfo.zip /usr/local/go/lib/time/zoneinfo.zip
COPY --from=builder /home/jarvisnote /home/jarvisnote
CMD ["./jarvisnote"]
