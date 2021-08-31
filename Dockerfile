FROM node:latest as node

WORKDIR /app

COPY ./ /app/

RUN npm run build -- --prod


FROM nginx:alpine

COPY --from=node /app/dis/dockerangular /usr/share/nginx/html

COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
