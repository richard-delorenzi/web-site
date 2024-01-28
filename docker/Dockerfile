FROM docker.io/library/debian
RUN apt-get update -y && apt-get install -y --no-install-recommends make tidy python3 python3-pip pipx && chown 1000:1000 /home

ENV HOME=/home PATH=/home/.local/bin:$PATH
USER 1000:1000
RUN python3 -m venv /home/.local && pip install markdown yafg mdx_truly_sane_lists
RUN pip install --use-pep517 mdx_linkify #https://github.com/pypa/pip/issues/8559
COPY markdown /home/.local/bin/markdown

WORKDIR /home/code/source
CMD ./_build
#CMD bash
