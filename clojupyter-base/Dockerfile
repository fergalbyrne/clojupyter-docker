FROM jupyter/minimal-notebook:aarch64-latest
LABEL maintainer="Klaus Harbo <klaus@harbo.net>"

ARG NB_USER=jovyan
ENV NOTEBOOK_PATH $HOME/notebooks
ENV PORT 8888
ENV CLOJUPYTER_PATH $HOME/clojupyter
ENV LEIN_ROOT 1

USER root
RUN    	apt update \
	&& apt-get install -y curl openjdk-11-jdk \
        build-essential procps curl file git \
#    && (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)") \
#    && brew install clojure/tools/clojure \
    && curl -O https://download.clojure.org/install/linux-install-1.11.1.1149.sh \
    && chmod +x linux-install-1.11.1.1149.sh \
    && sudo ./linux-install-1.11.1.1149.sh \
    && curl -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
 	&& chmod +x /usr/local/bin/lein \
 	&& lein self-install

