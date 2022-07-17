# clojupyter docker image

This is a non-official ``Dockerfile`` for [clojupyter](https://github.com/clojupyter/clojupyter) to
build a docker image to make it easy to try out the Clojupyter without having to install Jupyter
itself.  The image is intended primarily for demo purposes, most people will probably want to
install Jupyter and Clojupyter on their machine for real work.

## Usage (added for this fork for M1)

Clone this repo and build the docker images locally:
```bash
gh repo clone fergalbyrne/clojupyter-docker
cd clojupyter-docker
CLOJUPYTER_VERSION=0.3.3 make
```

Run the following command from your notebook directory:
```bash
path/to/clojupyter-docker/run-in-docker.sh
```

The docker server will print out a message containing a URL:
```bash
    To access the notebook, open this file in a browser:
        file:///home/jovyan/.local/share/jupyter/runtime/nbserver-7-open.html
    Or copy and paste one of these URLs:
        http://bad0eea61788:8888/?token=a54b30900f76766a2229cc148473452ca6ff9b9a6391c7dd
     or http://127.0.0.1:8888/?token=a54b30900f76766a2229cc148473452ca6ff9b9a6391c7dd
```
Copy the last of these into the address bar of your browser and enjoy!

## Usage (existing repo)

This project is already published on Docker hub.  The absolutely simplest way to run the image is
doing

```sh
docker run -p 8888:8888 --rm simplect/clojupyter:0.2.2
```

and following the instruction to connect to the server.  This will give an empty folder where you
can create notebooks from scratch.  The notebooks will be inside the container and disappear when it
terminates.

To access existing notebooks and/or keep notebooks after the container terminates you can map an
directory on the host machine into the `notebooks` directory in the container:

```sh
docker run -p 8888:8888 \
	-v /path/to/folder:/home/jovyan/notebooks \
	--rm simplect/clojupyter:0.2.2
```

If you want to load and use external libraries, mapping `$HOME/.m2` into the container will yield
much better performance:

```sh
docker run -p 8888:8888 \
	-v $HOME/.m2:/home/jovyan/.m2 \
	-v /path/to/folder:/home/jovyan/notebooks \
	--rm simplect/clojupyter:0.2.2
```

## Building the image

To build an image of clojupyter version `0.2.2` :

```sh
CLOJUPYTER_VERSION=0.2.2 make
```

A release of clojupyter with the name assigned to `CLOJUPYTER_VERSION` must exist.
