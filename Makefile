# Makefile for CV generation
# Author: Leonid Petrov

# LaTeX compiler settings
LATEX = latexmk
LATEX_FLAGS = -pdf -silent -synctex=1
CLEAN_FLAGS = -c

# Source files
CV_FULL = __petrovCV__.tex
CV_SHORT = __petrovCV__short.tex
CV_BRIEF = __petrovCV__brief_2page.tex
CV_BRIEF_ONE_MORE = __petrovCV__brief_2page_one_more.tex
PUBL = __petrov__publ.tex

# Generated PDFs
PDF_FULL = __petrovCV__.pdf
PDF_SHORT = __petrovCV__short.pdf
PDF_BRIEF = __petrovCV__brief_2page.pdf
PDF_BRIEF_ONE_MORE = __petrovCV__brief_2page_one_more.pdf
PDF_PUBL = __petrov__publ.pdf

# Remote publication lists
PUBLIST_URL = https://lpetrov.cc/research/TEX_publist.tex
CV_PUBLIST_URL = https://lpetrov.cc/research/TEX_CV_publist.tex
CV_PUBLIST_SHORT_URL = https://lpetrov.cc/research/TEX_CV_publist_short.tex

# Local publication list files
PUBLIST_TEX = TEX_publist.tex
CV_PUBLIST_TEX = TEX_CV_publist.tex
CV_PUBLIST_SHORT_TEX = TEX_CV_publist_short.tex

# Default target
all: $(PDF_FULL) $(PDF_SHORT) $(PDF_BRIEF) $(PDF_BRIEF_ONE_MORE) $(PDF_PUBL)
	@echo "Cleaning up intermediate files..."
	$(LATEX) $(CLEAN_FLAGS) $(CV_FULL)
	$(LATEX) $(CLEAN_FLAGS) $(CV_SHORT)
	$(LATEX) $(CLEAN_FLAGS) $(CV_BRIEF)
	$(LATEX) $(CLEAN_FLAGS) $(CV_BRIEF_ONE_MORE)
	$(LATEX) $(CLEAN_FLAGS) $(PUBL)
	rm -f $(PUBLIST_TEX) $(CV_PUBLIST_TEX) $(CV_PUBLIST_SHORT_TEX)
	rm -f *.gz

# Download publication lists
download-publists:
	@echo "Downloading publication lists..."
	wget -q --no-clobber=off $(PUBLIST_URL) -O $(PUBLIST_TEX)
	wget -q --no-clobber=off $(CV_PUBLIST_URL) -O $(CV_PUBLIST_TEX)
	wget -q --no-clobber=off $(CV_PUBLIST_SHORT_URL) -O $(CV_PUBLIST_SHORT_TEX)

# Build full CV
$(PDF_FULL): $(CV_FULL) download-publists
	@echo "Building full CV..."
	$(LATEX) $(LATEX_FLAGS) $(CV_FULL)

# Build short CV
$(PDF_SHORT): $(CV_SHORT) download-publists
	@echo "Building short CV..."
	$(LATEX) $(LATEX_FLAGS) $(CV_SHORT)

# Build publication list
$(PDF_PUBL): $(PUBL) download-publists
	@echo "Building publication list..."
	$(LATEX) $(LATEX_FLAGS) $(PUBL)

# Build brief CV (2 page)
$(PDF_BRIEF): $(CV_BRIEF) download-publists
	@echo "Building brief CV (2 page)..."
	$(LATEX) $(LATEX_FLAGS) $(CV_BRIEF)

# Build brief CV (2 page one more)
$(PDF_BRIEF_ONE_MORE): $(CV_BRIEF_ONE_MORE) download-publists
	@echo "Building brief CV (2 page one more)..."
	$(LATEX) $(LATEX_FLAGS) $(CV_BRIEF_ONE_MORE)

# Clean intermediate files
clean:
	@echo "Cleaning intermediate files..."
	$(LATEX) $(CLEAN_FLAGS) $(CV_FULL)
	$(LATEX) $(CLEAN_FLAGS) $(CV_SHORT)
	$(LATEX) $(CLEAN_FLAGS) $(CV_BRIEF)
	$(LATEX) $(CLEAN_FLAGS) $(CV_BRIEF_ONE_MORE)
	$(LATEX) $(CLEAN_FLAGS) $(PUBL)
	rm -f $(PUBLIST_TEX) $(CV_PUBLIST_TEX) $(CV_PUBLIST_SHORT_TEX)
	rm -f *.gz

# Clean everything including PDFs
clean-all: clean
	@echo "Cleaning PDFs..."
	rm -f $(PDF_FULL) $(PDF_SHORT) $(PDF_BRIEF) $(PDF_BRIEF_ONE_MORE) $(PDF_PUBL)

# Build and commit (replacement for git hook functionality)
build-and-commit: clean all
	@echo "Adding PDFs to git..."
	git add $(PDF_FULL) $(PDF_SHORT) $(PDF_BRIEF) $(PDF_BRIEF_ONE_MORE) $(PDF_PUBL)
	@echo "PDFs built and staged for commit"

# Individual targets
cv-full: $(PDF_FULL)
cv-short: $(PDF_SHORT)
cv-brief: $(PDF_BRIEF)
cv-brief-one-more: $(PDF_BRIEF_ONE_MORE)
publications: $(PDF_PUBL)

# Force rebuild
rebuild: clean all

# Show help
help:
	@echo "Available targets:"
	@echo "  all              - Build all documents (default)"
	@echo "  cv-full          - Build full CV only"
	@echo "  cv-short         - Build short CV only"
	@echo "  cv-brief         - Build brief CV (2 page) only"
	@echo "  cv-brief-one-more - Build brief CV (2 page one more) only"
	@echo "  publications     - Build publication list only"
	@echo "  download-publists - Download publication lists from web"
	@echo "  clean            - Clean intermediate files"
	@echo "  clean-all        - Clean all files including PDFs"
	@echo "  rebuild          - Clean and rebuild all"
	@echo "  build-and-commit - Build and stage PDFs for git commit"
	@echo "  help             - Show this help message"

# Declare phony targets
.PHONY: all clean clean-all download-publists build-and-commit rebuild help cv-full cv-short cv-brief cv-brief-one-more publications