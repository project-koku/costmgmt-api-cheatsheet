ADOC      := costmgmt-api-cheatsheet.adoc
HTML      := costmgmt-api-cheatsheet.html
PDF       := costmgmt-api-cheatsheet.pdf
PDF_THEME := theme/redhat-theme.yml
# asciidoctor-pdf resolves a theme argument containing a directory prefix
# as <themedir>/<path>, i.e. theme/theme/redhat-theme.yml — pass the bare
# filename; the tool itself picks it up from ./theme.
PDF_THEME_FLAG := redhat-theme.yml
CSS       := theme/redhat.css
FONTS     := fonts

.PHONY: all html pdf clean

all: html pdf

html: $(HTML)

pdf: $(PDF)

$(HTML): $(ADOC) $(CSS) docinfo-header.html
	asciidoctor -a stylesheet=$(CSS) -a linkcss! -a docinfo=shared $(ADOC) -o $(HTML)

$(PDF): $(ADOC) $(PDF_THEME)
	asciidoctor-pdf -a pdf-theme=$(PDF_THEME_FLAG) -a pdf-fontsdir=$(FONTS) $(ADOC) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF)
