make:
	@docker run -v `pwd`:/tmp latex pdflatex -halt-on-error -interaction=batchmode resume.tex

log:
	@docker run -v `pwd`:/tmp latex pdflatex resume.tex
