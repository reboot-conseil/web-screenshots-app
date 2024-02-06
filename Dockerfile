FROM ghcr.io/puppeteer/puppeteer:latest

RUN  echo $USER

WORKDIR /home/pptruser/app

COPY --chown=pptruser:pptruser package*.json ./

RUN npm ci

COPY --chown=pptruser:pptruser . .

ENV GOOGLE_APPLICATION_CREDENTIALS="/home/pptruser/app/web-screenshots-app-sa.json"

USER pptruser

ENTRYPOINT [ "npm", "run", "start"]