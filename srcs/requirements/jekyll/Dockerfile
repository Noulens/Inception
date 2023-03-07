FROM	alpine:3.16

RUN		apk update \
		&& apk upgrade

RUN		apk add ruby \
		&& apk add ruby-full ruby-dev \
		&& apk add gcc g++ make

RUN		gem install jekyll bundler \
		&& gem cleanup \
		mkdir /my_jekyll_blogs \
		&& jekyll new /my_jekyll_blogs/my_awesome_blog

WORKDIR	/my_jekyll_blogs/my_awesome_blog

EXPOSE	4000

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]

