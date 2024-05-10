# 指明基础镜像
FROM golang:1.20

# 指明服务要暴露的端口
EXPOSE 5000

# 项目的工作文件夹
WORKDIR /go/src/my_test

# 设置环境变量
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=http://goproxy.cn,direct

# 将mod和sum复制到容器中
COPY go.mod go.sum ./

# 安装依赖
RUN go mod download && go mod verify

# 将代码复制到容器中
COPY . .

# 运行服务
CMD ["go", "run", "."]