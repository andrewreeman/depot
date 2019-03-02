FROM ruby:2.6.0

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# expose port 3000
EXPOSE 3000

# Set the working directory to /app
WORKDIR /app

ENV BUNDLE_PATH /box
ENV GEM_PATH /box
ENV GEM_HOME /box

# Copy the current directory contents into the container at /app
COPY . /app

RUN gem install bundler
RUN gem install rails-controller-testing -v 1.0.4

COPY Gemfile Gemfile
RUN bundle install

#CMD ["rails", "server"]
