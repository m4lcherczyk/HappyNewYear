# STEP 1 

FROM node:alpine as build-step

RUN mkdir /app

WORKDIR /app

COPY package.json /app

COPY tsconfig.json /app

RUN npm install

COPY . /app

RUN npm run build 


# STAGE 2 

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/build /usr/share/nginx/html
