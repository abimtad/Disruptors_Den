# Use an official lightweight Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app


# Copy package.json and package-lock.json first
COPY . .

# Run Prisma generate
RUN npx prisma generate

# Expose Next.js port
EXPOSE 3000

# Set environment variables (this is optional, better to pass them at runtime)
ENV NODE_ENV=production

# Build the Next.js app
RUN npm run build

# Command to run the app
CMD ["npm", "run", "start"]
