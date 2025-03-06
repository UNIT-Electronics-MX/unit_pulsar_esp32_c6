# File Names
NAME = Unit Nano C6
file = src
DIRECTORIO = ./pdf/latex
DIR_HTML = ./src/build 
# Symbolic Targets
help:
	@echo "Use the following commands:"
	@echo "make all     create files and build the project"
	@echo "make pdfr     create the project environment"
	@echo "make clean   remove all  files"


all: build

build:
	@rm -rf docs && mkdir docs
	# @cd src && ./make.bat clean && ./make.bat html
	@cd src && make clean && make html
	@cp -R src/build/html/* docs && touch docs/.nojekyll
	@echo "Documentation built and copied to docs"
	@echo "All files removed"
	@find $(DIRECTORIO) -type f ! -name '*.pdf' -exec rm -f {} \;
	@cp -R pdf/latex/* pdf/ && rm -rf pdf/doctrees 
	@rm -rf $(DIRECTORIO)
	@echo "Archivos no PDF eliminados en $(DIRECTORIO)"
	@rm -rf $(DIR_HTML)
	
	


pdfx:
	@rm -rf pdf && mkdir pdf
	@cd src && make clean && sphinx-build -M latexpdf source ../pdf	
	@echo "PDF built and copied to docs"
	@make build

clean:
	@rm -rf docs
	@rm -rf pdf
	# @rm -rf src



	