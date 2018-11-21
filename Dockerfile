FROM gcr.io/google_appengine/nodejs

RUN /usr/local/bin/install_node '>=8.12.0'
WORKDIR /usr/src/app

COPY . /app/

RUN npm install -g @angular/cli --unsafe-perm || \
  ((if [ -f npm-debug.log ]; then \
      cat npm-debug.log; \
    fi) && false)

RUN npm install --unsafe-perm || \
  ((if [ -f npm-debug.log ]; then \
      cat npm-debug.log; \
    fi) && false)

CMD ng serve --host 0.0.0.0
