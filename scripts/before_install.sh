#!/bin/bash

#Parameters
APP_NAME="app"
USER="ec2-user"
INSTALL_DIR="/home/${USER}/${APP_NAME}"

#download node and npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node

#create our working directory if it doesnt exist
if [ -d "$INSTALL_DIR" ]; then
  echo "${INSTALL_DIR} exists"
else
  echo "Creating ${INSTALL_DIR} directory"
  mkdir ${INSTALL_DIR}
fi