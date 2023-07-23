all: out/output.html

%.article.auto.html: %.md
	echo '<article id="$(*F)">' >$@
	markdown $< >>$@
	echo '</article>' >>$@

sections/%.section.auto.html:
	@#echo building section $@ from $^
	echo '<section id="$(*F)">' >$@
	echo "<h1>$(*F)</h1>" >>$@ 
	cat /dev/null $^ >>$@
	echo '</section>' >>$@

sections.auto.html:
	@#echo building sections $@ from $^
	echo '<main>' >$@
	cat /dev/null $^ >>$@
	echo '</main>' >>$@

output.auto.html: head.html sections.auto.html foot.html
	@echo building output: $@ from $^
	cat $^ >$@

out/output.html: output.auto.html
	cp -T $< $@

-include sections.auto.mk

.PHONY: clean
clean:
	find . \( -iname "*.auto.mk" -o -iname "*.auto.html" \) -print0 | xargs -0 rm
