# Stage 1: build environment
FROM node:16.3-alpine3.11 as build-step
ARG ENV
ENV REACT_ENV=$ENV
WORKDIR /app
COPY package.json ./
RUN npm install --save --legacy-peer-deps
COPY . ./
RUN npm run build:$REACT_ENV

# Stage 2: run in nginx
FROM nginx:stable-alpine
WORKDIR /home/dvtt/app
## add permissions
RUN chown -R nginx:nginx /home/dvtt/app && chmod -R 755 /home/dvtt/app && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
## switch to non-root user
USER nginx
COPY --from=build-step /app/build /usr/share/nginx/html
#mount nginx config file
COPY nginx.conf /etc/nginx/conf.d/default.conf
## run server
CMD ["nginx", "-g", "daemon off;"]