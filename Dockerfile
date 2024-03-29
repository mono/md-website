# Run a development container like this: "docker build -t md-website $(pwd) && docker run -it -p 4000:4000 -v $(pwd):/repo md-website"

FROM ruby:3.1

ENV LANG=C.UTF-8
EXPOSE 4000

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

WORKDIR /repo
CMD bundle exec jekyll serve --incremental --watch -H 0.0.0.0 -P 4000
