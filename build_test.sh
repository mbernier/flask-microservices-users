echo "Build"
docker-compose -f docker-compose-prod.yml up -d --build
echo "recreate_db"
docker-compose -f docker-compose-prod.yml run users-service python manage.py recreate_db
echo "seed_db"
docker-compose -f docker-compose-prod.yml run users-service python manage.py seed_db
echo "test all the things"
docker-compose -f docker-compose-prod.yml run users-service python manage.py test
echo "Dun"
