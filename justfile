

default: run

run:
    # xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    # bibtex template
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex