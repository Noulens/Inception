#!/bin/sh

if [ ! -f /my_jekyll_blogs/.my_awesome_blog ]; then
	mkdir -p /my_jekyll_blogs/my_awesome_blog
	mv /tmp/my_awesome_blog/ my_jekyll_blogs/my_awesome_blog
	bundle init
	echo "gem 'jekyll'" >> Gemfile
	echo "gem 'minima', '~> 2.5'" >> Gemfile
	bundle install
	jekyll build
	touch /my_jekyll_blogs/.my_awesome_blog
fi
