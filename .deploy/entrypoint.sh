#!/bin/sh

echo "entrypoint.sh"

composer dump-autoload --no-interaction --no-dev

echo "artisan commands"

php artisan cache:clear
# php artisan migrate --no-interaction --force

echo "start supervisord"

supervisord -c $LARAVEL_PATH/.deploy/config/supervisor.conf
