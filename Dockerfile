FROM sharelatex/sharelatex:2.6.1
LABEL maintainer="github.com/robol"

RUN cd /var/www/sharelatex/web/ && npm install ldapjs && \
    tlmgr update --self && tlmgr install scheme-full

#overwrite  AuthenticationManager.js
COPY AuthenticationManager.js /var/www/sharelatex/web/app/src/Features/Authentication/

