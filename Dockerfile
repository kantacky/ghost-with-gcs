FROM ghost:5-alpine
WORKDIR /var/lib/ghost
RUN npm install --save ghost-google-cloud-storage
RUN export GHOST_ENVIRONMENT=production
RUN export CONTENT_PATH=$(jq -r '.paths.contentPath // "."' config.${GHOST_ENVIRONMENT}.json)
RUN mkdir -p ${CONTENT_PATH}/adapters/storage/gcloud
RUN echo "'use strict';\nmodule.exports = require('ghost-google-cloud-storage');" > ${CONTENT_PATH}/adapters/storage/gcloud/index.js
