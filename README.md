# wwww.citizenbar.fr

Frontend pour le site du bar

Géré avec [hugo](https://gohugo.io)

## Deploiement sur sourcehut

```
# deploiement à la demande
make deploy

# deploiement continue
git push origin   # <-- utilise le .build.yml
```

Sourcehut impose une CSP très restrictif empêchant d'inclure des ressources externes dans les pages

## Deploiement sur netlify


On veut donc aussi pouvoir déployer sur netlify (pour la prod par exemple)

```
# deploiement continue
git push gh       # <-- utilise le netlify.toml
```

