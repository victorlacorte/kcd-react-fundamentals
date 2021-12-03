FROM node:16

WORKDIR /usr/local
COPY package*.json setup.js ./
COPY scripts ./scripts
RUN NO_EMAIL_AUTOFILL=true node setup
ENV PATH=/usr/local/node_modules/.bin:$PATH

WORKDIR /usr/local/app
COPY --chown=node:node . ./

USER node