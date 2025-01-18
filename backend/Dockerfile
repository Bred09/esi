# Используем Node.js образ
FROM node:22-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем глобальные пакеты
RUN npm install -g express dotenv

# Устанавливаем зависимости
RUN npm i

# Копируем исходный код
COPY . .

# Указываем порт
EXPOSE 9000

# Запускаем сервер
CMD ["npm", "run", "app"]
