FROM ubuntu

RUN apt-get update -y \
    && apt-get install -yq nodejs npm

COPY app /srv/app
WORKDIR /srv/app
RUN npm install \
    && npm run build \
    && npm prune --omit=dev


FROM ubuntu

RUN apt-get update -y \
    && apt-get install -yq nodejs \
        ffmpeg intel-media-va-driver-non-free mediainfo

RUN mkdir -p /srv/app
COPY --from=0 /srv/app/node_modules /srv/app/node_modules
COPY --from=0 /srv/app/build /srv/app/build
COPY --from=0 /srv/app/package.json /srv/app/package.json

WORKDIR /srv/app

CMD ["node", "."]
