#  syntax=docker/dockerfile:1.2

FROM node:alpine3.16

RUN apk add openssh-client git

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan -H github.com >> ~/.ssh/known_hosts

WORKDIR /usr/app

RUN --mount=type=ssh git clone git@github.com:MorganMLGman/chmura_lab3.git ./

RUN npm install

CMD ["npm", "start"]