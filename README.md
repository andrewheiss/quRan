# quRan <img src="tools/logo.png" align="right"/>

## An R package for the full text of the Qur'an

This package contains the complete text of the Qur'an in Arabic (with and without vowels) and in English (the Yusuf Ali and Saheeh International translations).

The text for each volume or translation was sourced from ASDF

Each volume is in a data frame with a row for each ayah, along with 18 columns of detailed metadata (including ayah number, surah number, surah name in Arabic and English, juz', hizb, and so on), ready for text analysis. 

The package contains:

- `quran_ar`: The Qur'an in Arabic (with vowels)
- `quran_ar_min`: The Qur'an in Arabic (without vowels)
- `quran_en_yusufali`: The Yusuf Ali English translation of the Qur'an
- `quran_en_sahih`: The Saheeh International English translation of the Qur'an

Surah titles in Arabic, transliterated English, and translated English are all factors to preserve the correct order.


## Installation

This package is not released on CRAN yet. You can install the development version from Github:

```r
library(remotes)
install_github("andrewheiss/quRan")
library(quRan)
```


## Usage

For some ideas on getting started with analyzing these texts, see [*Text Mining with R* by Julia Silge and David Robinson](https://www.tidytextmining.com/), or Julia Silge's [blog post on sentiment analysis of Jane Austen's novels](https://juliasilge.com/blog/if-i-loved-nlp-less/). For help within R, try `?quran_ar` or similar for getting started with the datasets.


## Code of Conduct

This project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.


## Credits

The text and translations are all open source or licensed under Creative Commons by [Tanzil](http://tanzil.net/docs/download) and [Al Quran Cloud](https://alquran.cloud/). Complete details are found in the [LICENSE](/LICENSE) file.
