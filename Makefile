all: update-external
	ussm

update-external:
	# todo: pull in docs, vim, ... from git

upload: all
	rsync -avz _ussm/www/* ori@mimir.eigenstate.org:~/www/myrlang.org
