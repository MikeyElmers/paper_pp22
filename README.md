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
    * [tree structure](#tree-structure)
    * [data](#data)
    * [docs](#docs)
    * [output](#output)
    * [scripts](#scripts)
- [Issues/comments/suggestions](#issuescommentssuggestions)
- [License](#license)
- [References](#references)

## Instructions
1. Clone repository.
   ```bash
   git clone https://github.com/MikeyElmers/paper_P-P22.git
   cd paper_P-P22/
   ```
2. Plots, Rmarkdown documents, and the sessionInfo are located in `output/`. The P&P '22 abstract and poster are located in `docs`.

3. If you would like to re-run the entire analysis: 
    + NOTE: This will delete all the data from the `data/final/` as well as everything in `output/` except for sessionInfo.txt to run the pipeline from scratch. 
   ```bash
   make clean
   make project
   ```

## Directory Information
### tree structure
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
- Rmarkdown documents
- `sessionInfo.txt`: R session info

### `scripts`
- `00_renvRestore.R`: Restores packages
- `01_clean.R`: Cleans and exports final data
- `02_eda.Rmd`: Exploratory data analysis
- `03_plots.Rmd`: Generates plots

## Issues/Comments/Suggestions
Please use the [issue tracker](https://github.com/MikeyElmers/paper_P-P22/issues).

## License
This code is licensed under the terms of the MIT license. See [LICENSE.md](https://github.com/MikeyElmers/paper_P-P22/blob/master/LICENSE.md)

## References
Langdon Hammer, Modern Poetry (Yale University: Open Yale Couses), http://oyc.yale.edu (Accessed June 27, 2022). License: Creative Commons BY-NC-SA

John Wargo, Environmental Politics and Law (Yale University: Open Yale Couses), http://oyc.yale.edu (Accessed June 27, 2022). License: Creative Commons BY-NC-SA
  
John Merriman, European Civilization, 1648-1945 (Yale University: Open Yale Couses), http://oyc.yale.edu (Accessed June 27, 2022). License: Creative Commons BY-NC-SA
    
Keith Wrightson, Early Modern England: Politics, Religion, and Society under the Tudors and Stuarts (Yale University: Open Yale Couses), http://oyc.yale.edu (Accessed June 27, 2022). License: Creative Commons BY-NC-SA
    
Roberto González Echevarría, Cervantes' Don Quixote (Yale University: Open Yale Couses), http://oyc.yale.edu (Accessed June 27, 2022). License: Creative Commons BY-NC-SA



