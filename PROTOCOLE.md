# Protocole

## Préparer un event

### Demander aux artistes 

- Images
- Texte de description
- Autorisation de diffusion du replay

### Créer le répertoire des images de l'event

Créer le répertoire pour uploader les images : 
* `static/images/events/yyyy-mm-dd/`

### Uploader les images de l'event

Mettre autant d'image que l'on veut :
* `static/images/events/yyyy-mm-dd/image-x.jpg`

### Créer l'event

* `content/french/events/xxxxxxxxxxxxxxxx.md`
```yaml
---
date: YYYY-MM-DD
title: Titre
description: Description
featured: false
images: 
  - static/images/events/yyyy-mm-dd/image-1.jpg    
  - static/images/events/yyyy-mm-dd/image-2.jpg
  - static/images/events/yyyy-mm-dd/image-3.jpg
#watch:
---

## Titre

Description
```

### Promouvoir sur buffer
