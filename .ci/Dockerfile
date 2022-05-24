FROM node:18-alpine

RUN apk update && apk upgrade && apk add --no-cache curl bash git

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --loglevel=warn

COPY . .

ENTRYPOINT []
CMD []
