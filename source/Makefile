.PHONY: trap
trap:
	@echo run ./build to build

all: out/climate.html

%.article.auto.html: %.md
	echo '<article id="$(*F)">' >$@
	markdown $< >>$@
	echo '</article>' >>$@

sections/%.section.auto.html:
	@echo building section $@ from $^
	echo -n >$@
	echo '<section id="$(*F)">' >>$@
	echo '<h1>$(*F)</h1>' >>$@
	cat /dev/null $^ >>$@
	echo '</section>' >>$@

sections.auto.html:
	@echo building sections $@ from $^
	echo -n >$@
	echo '<header>Logo</header>' >>$@
	echo '<nav>' >>$@
	echo '<h1>Table of content</h1>' >>$@
	cat  toc.auto.html >>$@
	echo '</nav>' >>$@
	echo '<main>' >>$@
	cat /dev/null $^ >>$@
	echo '</main>' >>$@

output.auto.html: head.html sections.auto.html foot.html
	@echo building output: $@ from $^
	cat $^ >$@

out/climate.html: output.auto.html
	cp -T $< $@

-include sections.auto.mk

.PHONY: clean
clean:
	find . \( -iname "*.auto.mk" -o -iname "*.auto.html" \) -print0 | xargs -0 rm
