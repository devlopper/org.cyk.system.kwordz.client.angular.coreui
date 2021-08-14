docker stop kwordz-client-angular-container
docker build -t kwordz-client-angular-image ../../
docker create --name kwordz-client-angular-coreui-container --rm -p 8180:80 kwordz-client-angular-coreui-image:latest
docker start kwordz-client-angular-coreui-container