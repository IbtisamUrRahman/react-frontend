FROM node:alpine as builder

WORKDIR '/usr/app'

COPY package.json /usr/app

RUN npm install

COPY . /usr/app

RUN npm build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html