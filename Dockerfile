FROM sharelatex/sharelatex:latest
LABEL maintainer="github.com/worksasintended"
RUN cd /var/www/sharelatex/web/ && npm install ldapjs
#overwrite  AuthenticationManager.js
COPY AuthenticationManager.js /var/www/sharelatex/web/app/src/Features/Authentication/

