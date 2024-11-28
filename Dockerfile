FROM ghost:5-alpine
ARG GITHUB_TOKEN
RUN echo '//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}' >> $GHOST_INSTALL/.npmrc
RUN echo '@kantacky:registry=https://npm.pkg.github.com' >> $GHOST_INSTALL/.npmrc
RUN npm install --save @kantacky/ghost-google-cloud-storage
RUN rm -rf $GHOST_INSTALL/.npmrc
COPY docker-entrypoint.sh /usr/local/bin
