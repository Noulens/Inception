FROM	alpine:3.16

RUN		apk update \
		&& apk upgrade

RUN		apk add ruby \
		&& apk add ruby-full ruby-dev \
		&& apk add gcc g++ make

RUN		gem install jekyll bundler \
 		&& gem cleanup

COPY	./conf/run.sh /
RUN		chmod +x /run.sh

WORKDIR	/tmp
COPY	./my_awesome_blog/ .

RUN		/run.sh

EXPOSE	4000

CMD [ "bundle", "exec", "jekyll", "serve", "--livereload", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]

