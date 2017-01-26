all: update-external
	ussm

update-external: spec.txt

spec.txt: update-gits
	rm -f spec.txt
	echo '{' >> spec.txt
	echo '	title	: Spec' >> spec.txt
	echo '	description	: Myrddin Language Spec' >> spec.txt
	echo '}' >> spec.txt
	echo 'Myrddin Language Specification' >> spec.txt
	echo '------------------------------' >> spec.txt
	cat ../eigenstate-gits/mc/doc/lang.txt | sed 's/^/    /' >> spec.txt

update-gits:
	cd ../eigenstate-gits/mc/ && git pull

upload: all
	rsync -avz _ussm/www/* ori@mimir.eigenstate.org:~/www/myrlang.org
