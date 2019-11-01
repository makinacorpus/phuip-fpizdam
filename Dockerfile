FROM corpusops/golang
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -qq
ADD apt.txt ./
RUN apt install -y $(cat apt.txt)
RUN git clone https://github.com/neex/phuip-fpizdam/ /go/src/github.com/neex/phuip-fpizdam
WORKDIR /go/src/github.com/makinacorpujs/phuip-fpizdam
ADD ./ ./
RUN go get . 
RUN go build .
