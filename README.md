# quRan <img src="tools/logo.png" align="right"/>

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/quRan)](https://cran.r-project.org/package=quRan)
[![DOI](https://zenodo.org/badge/163343504.svg)](https://zenodo.org/badge/latestdoi/163343504)

## An R package for the full text of the Qur'an

This package contains the complete text of the Qur'an in Arabic (with and without vowels) and in English (the Yusuf Ali and Saheeh International translations).

The text for each volume or translation was sourced from [Tanzil](http://tanzil.net/docs/download) and [Al Quran Cloud](https://alquran.cloud/).

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

Here's how to do some basic data manipulation with the data:

``` r
library(dplyr)
library(quRan)

quran_ar %>% 
  group_by(surah_title_en) %>% 
  summarize(total_ayat = n())
#> # A tibble: 114 x 2
#>    surah_title_en total_ayat
#>    <fct>               <int>
#>  1 Al-Faatiha              7
#>  2 Al-Baqara             286
#>  3 Aal-i-Imraan          200
#>  4 An-Nisaa              176
#>  5 Al-Maaida             120
#>  6 Al-An'aam             165
#>  7 Al-A'raaf             206
#>  8 Al-Anfaal              75
#>  9 At-Tawba              129
#> 10 Yunus                 109
#> # ... with 104 more rows

quran_ar %>% 
  filter(surah_title_en == "Al-Faatiha") %>% 
  select(surah, ayah, text)
#> # A tibble: 7 x 3
#>   surah  ayah text                                                
#>   <int> <int> <chr>                                               
#> 1     1     1 بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ                              
#> 2     1     2 الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ                               
#> 3     1     3 الرَّحْمَٰنِ الرَّحِيمِ                                       
#> 4     1     4 مَالِكِ يَوْمِ الدِّينِ                                      
#> 5     1     5 إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ                              
#> 6     1     6 اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ                               
#> 7     1     7 صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ
```


## Code of Conduct

This project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.


## Credits

The text and translations are all open source or licensed under Creative Commons by [Tanzil](http://tanzil.net/docs/download) and [Al Quran Cloud](https://alquran.cloud/). The licenses have been converted to MIT here, due to CRAN's policy that the entire package use the same license throughout.

---

Tanzil Quran License

- This quran text is distributed under the terms of a Creative Commons
  Attribution 3.0 License.

- Permission is granted to copy and distribute verbatim copies of this text,
  but CHANGING IT IS NOT ALLOWED.

- This quran text can be used in any website or application, provided its source
  (Tanzil.net) is clearly indicated, and a link is made to http://tanzil.net to
  enable users to keep track of changes.

- This copyright notice shall be included in all verbatim copies of the text,
  and shall be reproduced appropriately in all files derived from or containing
  substantial portion of this text.

---

Text taken from AlQuran.cloud and the Islamic Network is open source

https://alquran.cloud/terms-and-conditions

---

Saheeh International Translation provided by the Qur'an Project with no rights reserved

See https://archive.org/stream/QuranTranslationBySaheehInternational/Quran%20-%20Translation%20by%20Saheeh%20International_djvu.txt

---

Fatihah background in hex icon from [seeklogo](https://seeklogo.com/vector-logo/183552/sureh-fatiha). 
