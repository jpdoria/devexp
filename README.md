
        $$\                                                   
        $$ |                                                  
    $$$$$$$ | $$$$$$\ $$\    $$\  $$$$$$\  $$\   $$\  $$$$$$\  
    $$  __$$ |$$  __$$\\$$\  $$  |$$  __$$\ \$$\ $$  |$$  __$$\ 
    $$ /  $$ |$$$$$$$$ |\$$\$$  / $$$$$$$$ | \$$$$  / $$ /  $$ |
    $$ |  $$ |$$   ____| \$$$  /  $$   ____| $$  $$<  $$ |  $$ |
    \$$$$$$$ |\$$$$$$$\   \$  /   \$$$$$$$\ $$  /\$$\ $$$$$$$  |
    \_______| \_______|   \_/     \_______|\__/  \__|$$  ____/ 
                                                    $$ |      
                                                    $$ |      
                                                    \__|      

# Table of Contents

- [About](#about)
- [How it works](#how-it-works)
    - [start.sh](#start.sh)
    - [test.sh](#start.sh)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
    - [Download this repository to your local](#download-this-repository-to-your-local)
    - [Download the Ubuntu Official Docker Image](#download-the-ubuntu-official-docker-image)
    - [Start the container](#start-the-container)
    - [Create symlinks](#create-symlinks)
    - [Test symlinks](#test-symlinks)
- [Demo](#demo)

# About

This project creates symbolic links with the same base filename only if the file extension is `*.s` within the directory that is provided as an argument, and skips the rest of the files. The symbolic link ends in `*.t` extension.

The symbolic links can be tested using a separate script included in this repository.

# How it works

## `start.sh`

1. It will check if the directory argument is empty. If yes, it will display the `usage` and exit (`exit 1`).
1. If not, the script will start checking if there are files that end in `*.s` extension inside the provided path, and it will exit if files do not exist (`exit 2`).
1. If the files are present, the script will start creating symbolic links and it will write the paths to `results.txt`.

## `test.sh`

1. It will check if the `results.txt` exists. If not, it will return `Nothing test here.` and exit (`exit 1`).
1. If yes, the script will parse path by getting the first field using `awk` and by removing the single quotes globally (`'`) using `sed`. After parsing, the values will be assigned to `FILES` variable.
1. Using the `FILES` variable, the script will check if each file exists and if it is a symbolic link.
1. If not, it will display an error that it does not exist.
1. Successful test results will display something like this `/path/to/file is a symlink`.

# Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
    - Tested using Docker Desktop for macOS v3.3.3 (64133)
    - Engine version 20.10.6, build 370c289
- [Ubuntu Official Docker Image](https://hub.docker.com/_/ubuntu)
    - Tested using `ubuntu:latest`
    - Image Digest: `sha256:adf73ca014822ad8237623d388cedf4d5346aa72c270c5acc01431cc93e18e2d`

# Usage

## Download this repository to your local

```bash
git clone https://github.com/jpdoria/devexp.git
```

## Download the Ubuntu Official Docker Image

```bash
docker pull ubuntu:latest
```

## Start the container

```bash
docker run --name devexp --rm -it -v $PWD/devexp:/root/devexp -w /root/devexp ubuntu:latest bash
```

## Create symlinks

```bash
./start.sh <path/to/directory>
```

## Test symlinks

```bash
./test.sh
```

# Demo

![Demo](https://github.com/jpdoria/devexp/blob/main/demo.gif)
