# Overleaf community image + LDAP authentication

This work is based on the LDAP authentication implemented over the Overleaf
community edition by [kemnitzs](https://github.com/kemnitzs) and
[worksasintended](https://github.com/worksasintended). It currently work with
the sharelatex image 2.4.2.

It is configured for the needs of the UniPi LDAP configuration, and uses
STARTTLS (hardcoded) and the given credentials to bind to LDAP directly, without
the need of an LDAP superuser password.

For a more generic solution, please refer to
the original repository](https://github.com/worksasintended/overleaf_ldap).

This solution uses ldapjs.

## Usage

Edit `docker-compose.yml` to fit your local setup.

- `ADMIN_MAIL`: login for local admin user which gets checked before the ldap routine during login. This is the only user that can login if ldap is down and does not need to exist in ldap. You need to create the same user in overleaf, for example using the launchpad. The admin user does not have to be in the same domain as other users.
- `DOMAIN`: At the current state, only users of a single domain are allowed (though easy to change). For a given user `user123@domain123.com` trying to login, `domain123.com` is compared with `DOMAIN`. For the ldap authentification only the username `user123` is used.  
- `LDAP_SERVER`: address of the ldap server

You will need to tweak the code in `AuthenticationManager.js` to have the
correct base DN.

For persistent storage use volumes.

### Start the server using docker-compose

```
docker-compose up -d --build

```
