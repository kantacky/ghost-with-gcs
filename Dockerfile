FROM ghost:5-alpine
WORKDIR /var/lib/ghost
RUN echo '@kantacky:registry=https://npm.pkg.github.com' >> .npmrc
RUN npm install --save @kantacky/ghost-google-cloud-storage
RUN mkdir -p /var/lib/ghost/adapters/storage
RUN cp -r node_modules/@kantacky/ghost-google-cloud-storage/gcloud ./adapters/storage/
