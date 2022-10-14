[![orcid](https://img.shields.io/badge/ORCID-0000--0002--3929--788X-green?style=plastic&logo=orcid&url=https://orcid.org/0000-0002-3929-788X)](https://orcid.org/0000-0002-3929-788X)

# Pause-internal particles in university lectures
This repository contains the data and code for "Pause-internal particles in university lectures" by Mikey Elmers and Jürgen Trouvain for the 18th Phonetik und Phonologie (P&P '22), Bielefeld, October 6-7. This project investigates pause-internal particles (PINTs) in Yale university lectures and lectures from the TOEFL iBT Listening Practice.

The following PINTs are investigated: 

* silence (sil)
* inhalation noise (in)
* exhalation noise (ex)
* filler particles (uh/um)
* tongue click (cl)
* other (o) such as cough, swallowing, laughter, etc.

## Table Of Contents

- [Instructions](#instructions)
- [Directory information](#directory-information)
    * [Tree structure](#tree-structure)
    * [data](#data)
    * [docs](#docs)
    * [output](#output)
    * [scripts](#scripts)
- [Issues/comments/suggestions](#issuescommentssuggestions)
- [License](#license)

## Instructions
1. Clone repository.
   ```bash
   git clone https://github.com/MikeyElmers/paper_P-P22.git
   cd paper_P-P22/
   ```
2. open `paper_P&P22.Rproj` project file

3. run files from script directory in numerical order


## Directory Information
### Tree structure
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
├── Makefile
├── output
│   ├── 02_eda.html
│   ├── 03_plots.html
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
    ├── 01_clean.R
    ├── 02_eda.Rmd
    └── 03_plots.Rmd
</pre>

### `data`
- Raw data
- Final data

### `docs`
- `elmers_pp22_abstract.pdf`: P&P '22 abstract submission
- `elmers_pp22_poster.pdf`: P&P '22 poster submission

### `output`
- Plots
- `sessionInfo.txt`: R session info

### `scripts`
- `00_renvRestore.R`: Restores packages
- `01_load.R`: Load raw data
- `02_clear.R`: Cleans and exports final data
- `03_eda.Rmd`: Exploratory data analysis
- `04_plots.Rmd`: Generates plots

## Issues/Comments/Suggestions
Please use the [issue tracker](https://github.com/MikeyElmers/paper_P-P22/issues).

## License
This code is licensed under the terms of the MIT license. See [LICENSE.md](https://github.com/MikeyElmers/paper_P-P22/blob/master/LICENSE.md)



