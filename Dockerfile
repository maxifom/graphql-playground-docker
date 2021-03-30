FROM alpine as builder
WORKDIR /
RUN apk add --no-cache wget 
RUN wget https://raw.githubusercontent.com/graphql/graphql-playground/master/packages/graphql-playground-html/withAnimation.html

FROM nginx:stable-alpine
COPY --from=builder /withAnimation.html /usr/share/nginx/html/index.html
COPY nginx-graphql-playground.conf.template /etc/nginx/templates/
RUN rm /etc/nginx/conf.d/default.conf
