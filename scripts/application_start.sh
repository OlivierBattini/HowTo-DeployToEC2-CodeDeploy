#!/bin/bash

USER="ec2-user"
APP_DIR="app"

# Give permission for everything in the application directory
sudo chmod -R 777 /home/$USER/$APP_DIR

# Navigate into our working directory where GitHub files have been deployed
cd /home/$USER/$APP_DIR

# Add npm and node to path
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm	
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion (node is in path now)

# Activate nvm
. ~/.nvm/nvm.sh

# Install project dependencies
npm install

# Start application in background using
npm start > app.out.log 2> app.err.log < /dev/null & 