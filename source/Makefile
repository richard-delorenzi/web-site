all: html_parts

%.part.html: %.md
	echo '<section>' >$@
	markdown $< >$@
	echo '</section>' >$@

%.section.html:


include sections.auto.mk

