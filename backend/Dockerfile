# Используем Node.js образ
FROM node:alpine as build

WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install --verbose

# Копируем исходный код
COPY . .

# Указываем порт
EXPOSE 9000

# Запускаем сервер
CMD ["npm", "run", "app"]