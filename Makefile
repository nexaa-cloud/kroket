current_dir = $(shell pwd)

serve: themes/fluency
	docker run --rm -v $(current_dir):/project -w /project -p 1313:1313 ghcr.io/gohugoio/hugo:v0.148.2 server -D --bind=0.0.0.0

themes/fluency:
	git submodule update --init --recursive

new-post:
	docker run --rm -v $(current_dir):/project -w /project ghcr.io/gohugoio/hugo:v0.148.2 new content content/posts/$(name)/index.md
