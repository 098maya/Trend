# Use nginx image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy dist files into nginx html folder
COPY dist/ .

# Expose port
EXPOSE 3000

# Override default command to run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

