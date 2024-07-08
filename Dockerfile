FROM node

COPY app /srv/app
WORKDIR /srv/app
RUN npm install \
    && npm run build \
    && npm prune --omit=dev


FROM node

RUN mkdir -p /srv/app
COPY --from=0 /srv/app/node_modules /srv/app/node_modules
COPY --from=0 /srv/app/build /srv/app/build
COPY --from=0 /srv/app/package.json /srv/app/package.json

WORKDIR /srv/app

CMD ["node", "."]
