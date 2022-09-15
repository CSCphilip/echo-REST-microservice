FROM golang:latest

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go mod init example/echo-REST-microservice
RUN go get github.com/CSCphilip/echo-REST-microservice/main@latest
RUN cd /build && git clone https://github.com/CSCphilip/echo-REST-microservice.git

RUN cd /build/echo-REST-microservice/main && go build -buildvcs=false

EXPOSE 8000

ENTRYPOINT [ "/build/echo-REST-microservice/main/main" ]