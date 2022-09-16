FROM golang:latest

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go mod init example/echo-REST-microservice

ADD https://api.github.com/repos/CSCphilip/echo-REST-microservice/git/refs/heads/main /build/version.json
RUN go get github.com/CSCphilip/echo-REST-microservice/main@latest
RUN cd /build && git clone -b main https://github.com/CSCphilip/echo-REST-microservice.git

RUN cd /build/echo-REST-microservice/main && go build -buildvcs=false

EXPOSE 8000

ENTRYPOINT [ "/build/echo-REST-microservice/main/main" ]