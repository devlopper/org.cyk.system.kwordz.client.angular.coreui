docker stop kwordz-client-angular-container
docker build -t kwordz-client-angular-image ../../
docker create --name kwordz-client-angular-container --rm -p 8180:80 kwordz-client-angular-image:latest
docker start kwordz-client-angular-container