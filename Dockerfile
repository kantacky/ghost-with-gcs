FROM ghost:5-alpine
WORKDIR /var/lib/ghost
RUN npm install --save ghost-google-cloud-storage
RUN export GHOST_ENVIRONMENT=production
RUN export CONTENT_PATH=$(jq -r '.paths.contentPath // "."' config.${GHOST_ENVIRONMENT}.json)
RUN mkdir -p ${CONTENT_PATH}/adapters/storage/gcloud
RUN cat > ${CONTENT_PATH}/adapters/storage/gcloud/index.js << EOL \
  'use strict'; \
  module.exports = require('ghost-google-cloud-storage'); \
  EOL
