
# Setting database
 env $(cat .env | xargs) ./set_up_database.sh
 
# Setting up secrets
 env $(cat .env | xargs) ./set_up_secrets.sh
 

# TODOS
[ ] -> Configurar uvicorn
[ ] -> configurar celery y worker
[ ] -> Preparar docker compose
[ ] -> Configurar IA para ser ejecutado