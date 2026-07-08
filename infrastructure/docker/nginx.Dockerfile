FROM nginx:1.27-alpine

# Copy nginx main config file
COPY infrastructure/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
