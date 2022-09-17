FROM golang:latest

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go mod init example/echo-REST-microservice
RUN go get github.com/CSCphilip/echo-REST-microservice/code@latest

ADD https://api.github.com/repos/CSCphilip/echo-REST-microservice/git/refs/heads/main version.json
RUN git clone -b main https://github.com/CSCphilip/echo-REST-microservice.git

RUN cd ./echo-REST-microservice/code && go build -o main -buildvcs=false

EXPOSE 8000

ENTRYPOINT [ "/build/echo-REST-microservice/code/main" ]