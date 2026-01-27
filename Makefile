deps:
	bundle install
.PHONY: deps

serve:
	bundle exec jekyll serve --livereload --drafts
.PHONY: serve
