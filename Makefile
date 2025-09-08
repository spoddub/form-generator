.PHONY: install lint test

install:
	bundle install

lint:
	bundle exec rubocop -A

test:
	bundle exec rake test
