FROM node:alpine as builder
WORKDIR /home/node
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/node/build /usr/share/nginx/html