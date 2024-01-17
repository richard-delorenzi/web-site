FROM docker.io/library/debian
RUN apt-get update -y && apt-get install -y --no-install-recommends make tidy python3 python3-pip pipx && chown 1000:1000 /home

ENV HOME=/home PATH=/home/.local/bin:$PATH
USER 1000:1000
RUN pipx install markdown
RUN ln -s -T markdown_py /home/.local/bin/markdown   
WORKDIR /home/code/source
CMD ./_build
