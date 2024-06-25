# Use the official Ubuntu 22.04 as a parent image
FROM ubuntu:22.04

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install basic packages
RUN apt-get update && apt-get install -y
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y sudo 
RUN sudo apt-get install -y vim
RUN sudo apt-get install -y tzdata
RUN sudo dpkg-reconfigure tzdata
RUN sudo apt-get update
RUN sudo apt-get -y upgrade
RUN sudo apt-get install -y php8.1-cli php8.1-sqlite3 php8.1-curl php8.1-mysql php8.1-readline php8.1-mbstring php8.1-xml php8.1-zip php8.1-intl
RUN sudo apt-get update
RUN sudo apt-get install -y php8.1-fpm
RUN sudo apt-get install -y nginx
RUN sudo apt-get install -y unzip
RUN sudo apt-get install -y curl
RUN curl -sS -k https://getcomposer.org/installer -o composer-setup.php
RUN sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN composer global require laravel/installer
RUN sudo apt-get update
RUN sudo apt-get install -y nodejs
# RUN sudo apt-get update
# RUN sudo apt-get install -y npm

# Install Node.js
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 20.11.0

WORKDIR $NVM_DIR
RUN apt-get install -y build-essential
RUN curl -o- -k https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
RUN . $NVM_DIR/nvm.sh \
    nvm install $NODE_VERSION \
    nvm alias default $NODE_VERSION \
    nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN rm -rf /var/lib/apt/lists/*


# Set the working directory
WORKDIR /app

# Copy any additional files you might need into the container
# COPY . /app

# Set the command to run when the container starts
CMD ["bash"]
