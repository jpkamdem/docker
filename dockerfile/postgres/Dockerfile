FROM postgres:18.0-alpine

# chemin vers ton fichier .sql ou .sh, préfère .sql quand même
# pour initialiser la db direct, pas besoin d'autres bails
ADD src/main/resources/migration.sql /docker-entrypoint-initdb.d/migration.sql
