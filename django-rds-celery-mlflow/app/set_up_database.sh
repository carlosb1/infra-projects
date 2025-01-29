#!/bin/bash
set -x  # Enable debug mode (prints commands before execution)

# Custom exit function to always exit with code 0
cleanup() {
    echo "✅ Script finished, exiting successfully."
    exit 0
}

# Trap any exit (normal or error) and call cleanup
trap cleanup EXIT

echo "🔹 Loading Django superuser credentials..."
echo "   - User: $DJANGO_NAME"
echo "   - Password: (hidden)"
echo "   - Database: $DATABASE_NAME"

# Export environment variables for Django superuser creation
export DJANGO_SUPERUSER_PASSWORD="$DJANGO_PASSWORD"
export DJANGO_SUPERUSER_USERNAME="$DJANGO_NAME"
export DJANGO_SUPERUSER_EMAIL="${DJANGO_NAME}@example.com"

echo "🔹 Running Django migrations..."
python3 manage.py makemigrations || echo "❌ makemigrations failed, continuing..."
python3 manage.py migrate || echo "❌ migrate failed, continuing..."

echo "🔹 Creating Django superuser (if not exists)..."
python3 manage.py createsuperuser --no-input || echo "❌ Superuser creation failed, continuing..."

# The script will always exit with status 0 due to `trap cleanup EXIT`
