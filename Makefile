all: Introduction/1.part.html

%.part.html: %.md
	markdown $< >$@
