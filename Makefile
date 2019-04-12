dask.html: dask.md
	pandoc -s -o dask.html dask.md
	pandoc -s --webtex -t slidy -o dask-slides.html dask.md

clean:
	rm -f dask*html
