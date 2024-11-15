FROM ghost:5-alpine
WORKDIR /var/lib/ghost
RUN npm install --save @kantacky/ghost-google-cloud-storage
RUN mkdir -p /var/lib/ghost/adapters/storage
RUN cp -r node_modules/ghost-google-cloud-storage/gcloud ./adapters/storage/
