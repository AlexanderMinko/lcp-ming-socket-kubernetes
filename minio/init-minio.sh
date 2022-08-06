#! /bin/bash
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/minio-binaries/mc
chmod +x $HOME/minio-binaries/mc
export PATH=$PATH:$HOME/minio-binaries/

mc alias set myminio1 http://192.168.49.2:31900 testadmin testadmin
mc config host rm local
mc config host add local http://192.168.49.2:31900 testadmin testadmin
mc rb --force local/ming/
mc mb --quiet local/ming/
mc mb --quiet local/ming-private/
mc policy set public local/ming
mc mv --recursive /home/ming/java-workspace/home/socket-microservices/init-files/images myminio1/ming
