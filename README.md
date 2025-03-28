# README - Configuration Docker pour Laravel et Angular

## Prérequis
- Docker et Docker Compose installés sur votre machine.
- Un projet Laravel dans `backend/`.
- Une version compilée d'Angular (dossier `dist/nom-du-projet/`) placée dans `frontend/`.

## Installation et Démarrage

### 1. Construire les conteneurs
```sh
docker-compose build
```

### 2. Démarrer les services
```sh
docker-compose up -d
```

## Structure du projet
```
.
├── src/   
     ├── angular # Projet Angular
     └── backend # Projet Laravel
├── docker/         # Configurations spécifiques à Docker (Nginx, PHP, etc.)
├── docker-compose.yml  # Configuration Docker Compose
└── README.md       # Ce fichier
```

## Configuration des services

### 1. Laravel (Backend)
- Placez les dossiers et fichiers de votre projet Laravel dans `backend/`.
- Assurez-vous que le dossier `vendor` est bien présent (`composer install` pour le créer)

### 2. Angular (Frontend)
- Compilez votre application Angular avec :
  ```sh
  ng build --configuration=production
  ```
- Placez le contenu du dossier compilé (`dist/nom-du-projet/browser`) dans `frontend/` (index.html, main-XXXX.js,etc).

## Accès aux services
- **Application Angular** : http://localhost:8081
- **Backend Laravel** : http://localhost:8000/...
- **phpMyAdmin** : http://localhost:8080

## Arrêter les services
```sh
docker-compose down
```

## Rebuild après modification
Si vous modifiez la configuration des conteneurs, reconstruisez-les avec :
```sh
docker-compose up --build -d
```

# Projet d'exemple

Un projet d'exemple est disponible sur GitHub à l'adresse suivante : [War.net](https://github.com/maximeBourciez/War.net.git)
