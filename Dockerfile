FROM php:8.1-apache

# Copier tous les fichiers Mikhmon dans le dossier web
COPY . /var/www/html/

# Fixer les permissions
RUN chown -R www-data:www-data /var/www/html

# Exposer le port utilisé par Render
EXPOSE 8080

# Changer le port Apache => 8080 (obligatoire pour Render)
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Activer les modules Apache
RUN a2enmod rewrite

CMD ["apache2-foreground"]
