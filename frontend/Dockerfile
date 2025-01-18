# Используем Node.js образ
FROM node:alpine as build

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm i

# Копируем исходный код
COPY . .

# Указываем порт
EXPOSE 3000

# Запускаем сервер
CMD ["npm", "run", "app"]
