make:
	@docker run -v `pwd`:/tmp latex pdflatex -halt-on-error -interaction=batchmode resume.tex
