[![orcid](https://img.shields.io/badge/ORCID-0000--0002--3929--788X-green?style=plastic&logo=orcid&url=https://orcid.org/0000-0002-3929-788X)](https://orcid.org/0000-0002-3929-788X)

# Pause-internal particles in university lectures
This repository contains the data and code for "Pause-internal particles in university lectures" by Mikey Elmers and Jürgen Trouvain for the 18th Phonetik und Phonologie (P&P '22), Bielefeld, October 6-7.

## Installation
```
git clone https://github.com/MikeyElmers/paper_P-P22
```

## File Structure
<pre>
├── data
│   ├── final
│   │   ├── toefl_all.csv
│   │   ├── toefl_pints.csv
│   │   ├── yale_all.csv
│   │   └── yale_pints.csv
│   ├── raw
│   │   ├── toeflAnnotations.csv
│   │   ├── toeflSummary.csv
│   │   ├── yaleAnnotations.csv
│   │   └── yaleSummary.csv
├── docs
│   ├── elmers_pp22_abstract.pdf
│   └── elmers_pp22_poster.pdf
├── LICENSE.md
├── output
│   ├── plot_between_lectures.png
│   ├── plot_boxplot.png
│   ├── plot_pie_chart.png
│   ├── plot_prop_bar.png
│   └── sessionInfo.txt
├── paper_P&P22.Rproj
├── README.md
├── renv.lock
└── scripts
    ├── 00_renvRestore.R
    ├── 00_renvSnapshot.R
    ├── 00_sessionInfo.R
    ├── 00_test.R
    ├── 01_load.R
    ├── 02_clean.R
    ├── 03_eda.html
    ├── 03_eda.Rmd
    ├── 04_plots.html
    └── 04_plots.Rmd
</pre>

### `data` contains
- Raw data
- Final data

### `docs` contains
- `elmers_pp22_abstract.pdf`: P&P '22 abstract submission
- `elmers_pp22_poster.pdf`: P&P '22 poster submission

### `output` contains
- Plots
- `sessionInfo.txt`: R session info

### `scripts` contains
- `00_renvRestore.R`: Restores packages
- `01_load.R`: Load raw data
- `02_clear.R`: Cleans and exports final data
- `03_eda.Rmd`: Exploratory data analysis
- `04_plots.Rmd`: Generates plots

## Issues/Comments/Suggestions
Please use the [issue tracker](https://github.com/MikeyElmers/paper_P-P22/issues).

## License
This code is licensed under the terms of the MIT license. See [LICENSE.md](https://github.com/MikeyElmers/paper_P-P22/blob/master/LICENSE.md)



