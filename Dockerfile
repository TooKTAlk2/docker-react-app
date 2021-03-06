# 빌드파일 만들기 시작 (Builder stage)
FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# 빌드 만들기 끝

# Run stage
# execute nginx
FROM nginx
EXPOSE 80

# build
COPY --from=builder /usr/src/app/build /usr/share/nginx/html