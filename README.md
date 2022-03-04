[![Netlify Status](https://api.netlify.com/api/v1/badges/ad63f9b3-f236-456d-9d87-e7b495d96fb7/deploy-status)](https://app.netlify.com/sites/citizenbar/deploys)

# Tech Stack

Nom           | Description
---           | ---
OVH           |  registrar
Cloudflare    |  DNS and CDN
Github        |  source code repo
Source Hut    |  source code repo + Static site hosting
Vex           |  Hugo theme
Hugo          |  Static site generator
Netlify       |  Building + Static site hosting
So You Start  |  Bare metal hosting
Jitsi         |  Self-hosted online meeting
Peertube      |  Self-hosted video service (youtube-like) and RTMP endpoint (record streamed videos)
Airsonic      |  Self-hosted audio service (spotify-like)
Ilograph      |  SaaS application for architecture diagram
ShareThis     |  Module de partage

# Build

## Outillage : netlify-cli

Install `asdf-vm`

```bash
$ apt install curl git

$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

$ cat >>~/.bashrc <<EOF
source \$HOME/.asdf/asdf.sh
source \$HOME/.asdf/completions/asdf.bash
EOF

$ source ~/.bashrc
```

Install and setup `nodejs` and `yarn` using `asdf-vm`

```bash
$ asdf plugin add nodejs
$ asdf install nodejs latest
$ asdf global nodejs latest

$ asdf plugin add yarn
$ asdf install yarn latest
$ asdf global yarn latest
```

Install `netlify-cli`

```bash
npm install netlify-cli -g
npm install -g npm@8.3.0
npm audit fix

netlify dev
```

## Développement

### Base de donnée

Il n'y a aucune base de donnée : c'est un site static.

L'édition se fait directement par les modifications des fichiers `.md` sur github.

### Guidelines

Quelques éléments pour retrouver ses petits avec Hugo

```
layouts/_default/baseof.html    # <-- <html><body></body></html>

layouts/partials/head.html      # <-- <head></head>

layouts/partials/header.html    # <-- <header></header>
layouts/partials/footer.html    # <-- <footer></footer>

layouts/index.html              # <-- homepage

layouts/{context}/list.html     # <-- list des items
layouts/{context}/single.html   # <-- details d'un item
```

## CI/CD

```
# pour netlify
netlify.toml

# pour sr.ht
.build.yml 
```

# Deploy

## Github

Déployer sur netlify

```
# deploiement continue
git push github          # <-- utilise le netlify.toml
```

## SourceHut

```
# deploiement à la demande
make deploy

# deploiement continue
git push srht            # <-- utilise le .build.yml
```

Attention : Sourcehut impose une CSP très restrictive empêchant d'inclure des ressources externes dans les pages !

## Misc

### Liens utiles

```
https://developers.google.com/speed
https://developers.google.com/speed/libraries#jquery

https://docs.netlify.com/configure-builds/environment-variables/

https://github.com/netlify/build-image/blob/focal/Dockerfile

https://sharethis.com/fr/

https://schema.org/EventSeries
```

### À propos du cache

#### Cloudflare (remote)

Nous utilisons Cloudflare comme CDN (Content Delivery Network) pour servir le contenu au plus proche de l'utilisateur et améliorer l'expérience de navigation

#### Navigateur (local)

Si le cache de firefox te crée des problèmes pour debug en phase de développement du site :

```
(1) about:config
(2) browser.cache.disk.enable => false
(3) browser.cache.memory.enable => false
```

# TODO 

* RTMP peertube
* Mixcloud

