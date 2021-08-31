FROM node:14.17.0-alpine as node

RUN mkdir /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod


FROM nginx:alpine



COPY --from=node /app/dis/dockerangular /usr/share/nginx/html

COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
