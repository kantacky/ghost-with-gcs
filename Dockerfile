FROM ghost:5-alpine
WORKDIR /var/lib/ghost
RUN npm install --save ghost-google-cloud-storage
RUN mkdir -p /var/lib/ghost/adapters/storage/gcloud
RUN echo "'use strict';\nmodule.exports = require('ghost-google-cloud-storage');" > /var/lib/ghost/adapters/storage/gcloud/index.js
