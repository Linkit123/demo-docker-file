# Getting Started

### `docker build --build-arg ENV=test -t demo-reactjs-dockerfile:1.0.9 .` to build image
- **ENV** is environment that you want to build: dev, test, staging, prod
- **1.0.9** is version, you can put anything else
### `docker run -d -p 8090:80 demo-reactjs-dockerfile:1.0.9` to start a container
- **8090** is port that you want to expose to host machine
- **demo-reactjs-dockerfile** is name of image that you are created a few minutes ago