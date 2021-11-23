# Stage 1: build environment
FROM node:13.12.0-alpine as build-step
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
RUN npm ci --silent
RUN npm install -g --silent
COPY . ./
RUN npm run build

# Stage 2: production environment
FROM nginx:stable-alpine
COPY --from=build-step /app/build /usr/share/nginx/html
#mount file config của nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
#mặc định ngnix sẽ expose cổng 80 muốn thay đổi phải mount file config của ngnix chứ k thể expose trong docker file, việc này là vô nghĩa
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]