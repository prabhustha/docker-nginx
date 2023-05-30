#node
FROM node:alpine3.10 as sample
WORKDIR /myapp
COPY package.json .
RUN npm install
COPY . .
RUN npm run build



#nginx 
FROM nginx:1.24-alpine

COPY --from=sample /myapp/build /usr/share/nginx/html
