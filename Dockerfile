# RUN with sudo docker-compose up --build -d

FROM node:14

WORKDIR /src

COPY package*.json ./

RUN npm install

COPY . .

#RUN ["chmod", "+x", "/src/scripts/wait-for-it.sh"]

CMD chmod +x ./scripts/wait-for-it.sh && ./scripts/wait-for-it.sh crmongo:27023 -t 15 -- npm run start