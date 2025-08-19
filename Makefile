current_dir = $(shell pwd)

serve:
	docker run --rm -v $(current_dir):/project -w /project -p 1313:1313 ghcr.io/gohugoio/hugo:v0.148.2 server -D --bind=0.0.0.0
