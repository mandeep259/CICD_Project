FROM alpine:3.20

# Metadata (good practice)
LABEL maintainer="mandeep"
LABEL app="myapp"

# Set working directory
WORKDIR /app

# Copy application
COPY app.sh /app/app.sh

# Ensure execution permission
RUN chmod +x /app/app.sh

# Run application
ENTRYPOINT ["/app/app.sh"]

