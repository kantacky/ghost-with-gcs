FROM ghost:5-alpine
ARG GITHUB_TOKEN
WORKDIR /var/lib/ghost
RUN echo '//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}' >> .npmrc
RUN echo '@kantacky:registry=https://npm.pkg.github.com' >> .npmrc
RUN npm install --save @kantacky/ghost-google-cloud-storage
RUN rm -rf .npmrc
RUN mkdir -p /var/lib/ghost/adapters/storage
RUN cp -r node_modules/@kantacky/ghost-google-cloud-storage/gcloud ./adapters/storage/
