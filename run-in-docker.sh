#!/usr/bin/env zsh

docker run -p 8888:8888 \
	-v $HOME/.m2:/home/jovyan/.m2 \
	-v `pwd`:/home/jovyan/notebooks \
	--rm clojupyter:0.3.3
