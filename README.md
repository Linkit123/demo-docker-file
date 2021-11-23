# docker build
docker build -t demo-docker-file:0.0.9 .

# docker run
docker run -it --name demo-docker-file-c --restart always -p 8888:5555 demo-docker-file:0.0.9
