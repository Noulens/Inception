#!/bin/sh

if [ ! -f /my_jekyll_blogs/.my_awesome_blog ]; then
	bundle init \
	&& echo "gem 'jekyll'" >> Gemfile \
	&& echo "gem 'minima', '~> 2.5'" >> Gemfile \
	&& bundle install \
	&& jekyll build
	touch /my_jekyll_blogs/.my_awesome_blog
fi
