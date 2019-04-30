all:

include Makefile.env

up:
	git push -u origin master
e:
	vim Makefile.env
m:
	vim Makefile
gs:
	git status
gc:
	git commit -a
	

gd :
	git diff

ga :
	git add .

rg:regen
regen:
	[ -f config.toml ] && make regenX || make regenX -C scripts.Hugo 
regenX:
	rm -fr public/*
	cp ../CNAME public/
	[ -f public/CNAME ] || ( echo ; echo "why no CNAME ? exit" ; echo ; exit 32 )
	hugo

s : server
server:
	hugo server

# hddps://themes.gohugo.io/
# hddps://gohugo.io/themes/

gen00:
	tree -H '.' -L 1 --noreport --charset utf-8 > index.html

gen:
	cd public/ && rm -f CNAME index.html
	cd public/ && tree -H '.' --noreport --charset utf-8 > index.html
	[ ! -f index.html ] || cat index.html > public/index.html 
	make sed01
	cp CNAME public/
	cat config > .git/config
	@echo
	@grep jjj123 CNAME 
	@echo
	@grep marstool .git/config
	@echo
	diff config .git/config
	@echo

sed01:
	sed -i \
		-e '/meta name=/d' \
		-e '/ by Steve Baker and Thomas Moore/d' \
		-e '/ by Francesc Rocher/d' \
		-e '/ by Florian Sesser/d' \
		-e '/ by Kyosuke Tokoro/d' \
		public/index.html
