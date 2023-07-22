all: output.auto.html

%.article.auto.html: %.md
	echo '<article id="$(*F)">' >$@
	markdown $< >>$@
	echo '</article>' >>$@

sections/%.section.auto.html:
	@#echo building section $@ from $^
	echo '<section id="$(*F)">' >$@
	cat /dev/null $^ >>$@
	echo '</section>' >>$@

sections.auto.html:
	@#echo building sections $@ from $^
	echo '<main>' >$@
	cat /dev/null $^ >>$@
	echo '</main>' >>$@

output.auto.html: head.html sections.auto.html foot.html
	@echo building output $@ from $^
	cat $^ >$@


-include sections.auto.mk

.PHONY: clean
clean:
	find . \( -iname "*.auto.mk" -o -iname "*.auto.html" \) -print0 | xargs -0 rm
