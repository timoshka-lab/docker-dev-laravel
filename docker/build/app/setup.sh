#!/bin/bash

set -e

LARAVEL_VERSION=""
SKIP_LARAVEL=false

for OPT in "$@"
do
  case $OPT in
    --version)
      LARAVEL_VERSION="$1"
      shift 1
      ;;
    --skip-laravel)
      SKIP_LARAVEL=true
      shift 1
      ;;
  esac
done

LARAVEL_DIR=/var/www/html/laravel-app
PHPMYADMIN_DIR=/var/www/html/phpmyadmin/public

echo "Starting application setup..."

if [ "$SKIP_LARAVEL" = false ]; then
  if [ -f "$LARAVEL_DIR/artisan" ]; then
    echo "Laravel is already installed. Skipping..."
  else
    LARAVEL_PACKAGE="laravel/laravel"

    if [ -n "$LARAVEL_VERSION" ]; then
      LARAVEL_PACKAGE="$LARAVEL_PACKAGE:$LARAVEL_VERSION"
    fi

    echo "Installing Laravel..."
    composer create-project "$LARAVEL_PACKAGE" "$LARAVEL_DIR"

    echo "Fixing Laravel permissions..."
    chown -R www-data:www-data $LARAVEL_DIR
  fi

  echo "Installing Laravel dependencies..."
  composer install --working-dir="$LARAVEL_DIR"
else
  echo "Skipping WordPress installation..."
fi

if [ -f "$PHPMYADMIN_DIR/libraries/classes/Version.php" ]; then
  echo "phpMyAdmin is already installed. Skipping..."
else
  echo "Downloading phpMyAdmin..."
  wget -qO- https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz  | tar xz -C $PHPMYADMIN_DIR --strip-components=1
fi

echo -e "\e[32mApplication setup is now Done!\e[0m"
