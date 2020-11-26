FROM node:12-alpine
RUN npm install -g vue-cli
WORKDIR /src
ENV HOST 0.0.0.0.
EXPOSE 3000
