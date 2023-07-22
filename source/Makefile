all: sections

%.article.auto.html: %.md
	echo '<article id="$(*F)">' >$@
	markdown $< >>$@
	echo '</article>' >>$@

%.section.auto.html:
	@echo building section $@ from $^
	echo '<section id="$(*F)">' >$@
	cat /dev/null $^ >$@
	echo '</section>' >>$@


include sections.auto.mk

.PHONY: clean
clean:
	find . -iname "*.auto.mk" -o -iname "*.auto.html" -print0 | xargs -0 | rm
