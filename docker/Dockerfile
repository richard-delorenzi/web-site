FROM docker.io/library/debian
RUN apt-get update -y && apt-get install -y --no-install-recommends make tidy python3 python3-pip
RUN apt-get update -y && apt-get install -y --no-install-recommends pipx

ENV HOME=/home PATH=/home/.local/bin:$PATH
RUN chown 1000:1000 /home
USER 1000:1000
RUN pipx install markdown
WORKDIR /home/code/source
CMD ./build
