# Docker image for CHIP 2.5 (Ruby Intro).
#
# Builds an environment with the Ruby version and gems the assignment needs,
# and defaults to the interactive RSpec runner menu. Also used as the base for
# GitHub Codespaces via .devcontainer/devcontainer.json.
#
# Adapted from the NYU CSE Software Engineering version of this assignment:
# https://github.com/NYU-CSE-Software-Engineering/hw-ruby-intro
# The assignment needs Ruby >= 3.3.8 (see Gemfile); track the latest 3.3.x
# patch release rather than freezing on one.
FROM ruby:3.3

RUN gem install bundler

WORKDIR /app

COPY Gemfile ./
RUN bundle install

COPY .rspec ./
COPY lib/ ./lib/
COPY spec/ ./spec/
COPY run_specs.sh ./
RUN chmod +x ./run_specs.sh

# Tip: run with `-v "$(pwd)":/app` so your local edits are visible inside the
# container without rebuilding the image (see DEVELOPING.md).
CMD ["./run_specs.sh"]
