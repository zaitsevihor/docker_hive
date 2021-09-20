FROM alpine
COPY . .
WORKDIR /
RUN apk update && apk add openssh 
