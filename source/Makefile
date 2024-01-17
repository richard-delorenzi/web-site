.PHONY: trap
trap:
	@echo run ./build to build

all: out/climate.html

# detect other changes to sections dir, to cause a section rebuild
./sections/%.dir: source/sections/%/
	@echo building dir_stamp $@ #from $^
	touch $@

%.article.auto.html: %.md
	@echo building article $@ #from $^
	echo -n >$@
	echo '<article id="article_$(*F)">' >>$@
	markdown $< >>$@
	echo '</article>' >>$@

sections/%.section.auto.html:
	@echo building section $@ #from $^
	echo -n >$@
	echo '<section id="section_$(*F)">' >>$@
	echo   "$(*F)" | sed -e 's/_/ /g' -e 's%.*%  <h1>\0</h1>%' >>$@
	echo '  <div class="article-box">'  >>$@
	cat       /dev/null $^ >>$@
	echo '  </div>' >>$@
	echo '</section>' >>$@

sections.auto.html:
	@echo building sections $@ #from $^
	echo -n >$@
	echo '<div class="side">' >>$@
	echo '  <header><h1>Climate</h1></header>' >>$@
	echo '  <nav>' >>$@
	echo '    <h1>Table of content</h1>' >>$@
	cat       toc.auto.html >>$@
	echo '  </nav>' >>$@
	echo '</div>' >>$@
	echo '<main>' >>$@
	cat    /dev/null $^ >>$@
	echo '</main>' >>$@

output.auto.html: head.html sections.auto.html foot.html
	@echo building output: $@ #from $^
	cat $^  >$@

out/climate.html: output.auto.html
	@echo copying to: $@ from: $^
	cp -T $< $@

-include sections.auto.mk


.PHONY: clean
clean: oldclean
	-rm -r ../build_dir
.PHONY: oldclean
oldclean:
	-find . \( -iname "*.auto.mk" -o -iname "*.auto.html" \) -print0 | xargs -r0 rm
.PHONY: veryclean
realclean: clean
	-find . \( -iname "*.orig" -o -iname "*~" \) -print0 | xargs -r0 rm
	-rm ../docs/climate.html
