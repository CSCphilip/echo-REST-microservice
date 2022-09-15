FROM golang:latest

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go install github.com/CSCphilip/echo-REST-microservice/main
RUN cd /build && git clone https://github.com/CSCphilip/echo-REST-microservice.git

RUN cd /build/echo-REST-microservice/main && go build

EXPOSE 8080

ENTRYPOINT [ "/build/echo-REST-microservice/main/main" ]