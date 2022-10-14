SCRIPT := ./scripts/

project:
	Rscript ${SCRIPT}/00_renvRestore.R
	Rscript ${SCRIPT}/01_clean.R
	Rscript -e "rmarkdown::render(here::here('scripts/02_eda.Rmd'), output_dir = here::here('output'))"
	Rscript -e "rmarkdown::render(here::here('scripts/03_plots.Rmd'), output_dir = here::here('output'))"

clean:
	find output/ -type f -name '*.html' | xargs rm
	find output/ -type f -name '*.png' | xargs rm
	find data/final/ -type f -name '*.csv' | xargs rm
