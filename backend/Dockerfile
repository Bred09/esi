# Используем Node.js образ
FROM node:alpine as build

WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install --verbose

# Копируем исходный код
COPY . .

# MySQL
RUN --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -d mysql:alpine

# Указываем порт
EXPOSE 9000

# Запускаем сервер
CMD ["npm", "run", "app"]