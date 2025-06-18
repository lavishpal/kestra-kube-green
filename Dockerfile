FROM kestra/kestra:latest

# Optional: Copy flows if you want to include them in the image
COPY flows /app/flows

# Set entrypoint to Kestra standalone mode
ENTRYPOINT ["/app/kestra"]
CMD ["standalone"]