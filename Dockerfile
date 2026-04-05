# 1. Use Node.js base image

FROM node:18-alpine

# 2. Set working directory

WORKDIR /app

# 3. Install dependencies first (better caching)

COPY package.json package-lock.json ./
RUN npm install

# 4. Copy rest of the project

COPY . .

# 5. Build Next.js app

RUN npm run build

# 6. Expose port

EXPOSE 3000

# 7. Start the app

CMD ["npm", "start"]
