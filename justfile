
default: run

run:
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    biber template
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex

# run without citation
run1:
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex

tex:
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex

bib:
    biber template