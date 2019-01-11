#' The Qur'an
#'
#' This package contains the complete text of the Qur'an in Arabic (with and
#' without vowels) and in English (the Yusuf Ali and Saheeh International
#' translations), formatted to be convenient for text analysis.
#' @docType package
#' @name quRan
#' @aliases quRan quRan-package
NULL

#' The text of the Qur'an (Arabic, all vowels)
#'
#' A dataset containing the Arabic text of the Qur'an, with vowels.
#'
#' Because Surahs 89 and 113 are both translated as "The Dawn," Surah 113 has
#' been retitled "The Daybreak"
#'
#' @source Tanzil (\url{http://tanzil.net/docs/download}) and Al Quran Cloud (\url{https://alquran.cloud/})
#' @format A data frame with 6236 rows and 18 columns:
#' \describe{
#'   \item{\code{surah_id}}{Unique id number for the surah}
#'   \item{\code{ayah_id}}{Unique id number for the ayah}
#'   \item{\code{surah_title_ar}}{Name of the surah (Arabic)}
#'   \item{\code{surah_title_en}}{Name of the surah (English; transliterated)}
#'   \item{\code{surah_title_en_trans}}{Name of the surah (English; translated)}
#'   \item{\code{revelation_type}}{Type of the surah (Meccan or Medinan)}
#'   \item{\code{text}}{Ayah text}
#'   \item{\code{surah}}{Surah}
#'   \item{\code{ayah}}{Ayah}
#'   \item{\code{ayah_title}}{Combined surah and ayah (e.g. 2:242)}
#'   \item{\code{juz}}{Juz'}
#'   \item{\code{manzil}}{Manzil}
#'   \item{\code{page}}{Page number}
#'   \item{\code{hizb_quarter}}{Maqra}
#'   \item{\code{sajda}}{Binary indicator for presence of a sajdah}
#'   \item{\code{sajda_id}}{Unique id number for the sajdah}
#'   \item{\code{sajda_recommended}}{Binary indicator for whether a sajdah is recommended}
#'   \item{\code{sajda_obligatory}}{Binary indicator for whether a sajdah is obligatory}
#' }
#'
#' @examples
#' # See first few rows
#' head(quran_ar)
#'
#' # How many ayahs are in each surah?
#' library(dplyr)
#'
#' quran_ar %>%
#'   group_by(surah_title_ar) %>%
#'   summarize(total_ayaat = n())
"quran_ar"

#' The text of the Qur'an (Arabic, no vowels)
#'
#' A dataset containing the Arabic text of the Qur'an, without vowels.
#'
#' Because Surahs 89 and 113 are both translated as "The Dawn," Surah 113 has
#' been retitled "The Daybreak"
#'
#' @source Tanzil (\url{http://tanzil.net/docs/download}) and Al Quran Cloud (\url{https://alquran.cloud/})
#' @format A data frame with 6236 rows and 18 columns:
#' \describe{
#'   \item{\code{surah_id}}{Unique id number for the surah}
#'   \item{\code{ayah_id}}{Unique id number for the ayah}
#'   \item{\code{surah_title_ar}}{Name of the surah (Arabic)}
#'   \item{\code{surah_title_en}}{Name of the surah (English; transliterated)}
#'   \item{\code{surah_title_en_trans}}{Name of the surah (English; translated)}
#'   \item{\code{revelation_type}}{Type of the surah (Meccan or Medinan)}
#'   \item{\code{text}}{Ayah text}
#'   \item{\code{surah}}{Surah}
#'   \item{\code{ayah}}{Ayah}
#'   \item{\code{ayah_title}}{Combined surah and ayah (e.g. 2:242)}
#'   \item{\code{juz}}{Juz'}
#'   \item{\code{manzil}}{Manzil}
#'   \item{\code{page}}{Page number}
#'   \item{\code{hizb_quarter}}{Maqra}
#'   \item{\code{sajda}}{Binary indicator for presence of a sajdah}
#'   \item{\code{sajda_id}}{Unique id number for the sajdah}
#'   \item{\code{sajda_recommended}}{Binary indicator for whether a sajdah is recommended}
#'   \item{\code{sajda_obligatory}}{Binary indicator for whether a sajdah is obligatory}
#' }
#'
#' @examples
#' # See first few rows
#' head(quran_ar_min)
#'
#' # How many ayahs are in each surah?
#' library(dplyr)
#'
#' quran_ar_min %>%
#'   group_by(surah_title_ar) %>%
#'   summarize(total_ayaat = n())
"quran_ar_min"

#' The Yusuf Ali translation of the Qur'an (English)
#'
#' A dataset containing the English text of the Yusuf Ali translation of the Qur'an.
#'
#' Because Surahs 89 and 113 are both translated as "The Dawn," Surah 113 has
#' been retitled "The Daybreak"
#'
#' @source Tanzil (\url{http://tanzil.net/docs/download}) and Al Quran Cloud (\url{https://alquran.cloud/})
#' @format A data frame with 6236 rows and 18 columns:
#' \describe{
#'   \item{\code{surah_id}}{Unique id number for the surah}
#'   \item{\code{ayah_id}}{Unique id number for the ayah}
#'   \item{\code{surah_title_ar}}{Name of the surah (Arabic)}
#'   \item{\code{surah_title_en}}{Name of the surah (English; transliterated)}
#'   \item{\code{surah_title_en_trans}}{Name of the surah (English; translated)}
#'   \item{\code{revelation_type}}{Type of the surah (Meccan or Medinan)}
#'   \item{\code{text}}{Ayah text}
#'   \item{\code{surah}}{Surah}
#'   \item{\code{ayah}}{Ayah}
#'   \item{\code{ayah_title}}{Combined surah and ayah (e.g. 2:242)}
#'   \item{\code{juz}}{Juz'}
#'   \item{\code{manzil}}{Manzil}
#'   \item{\code{page}}{Page number}
#'   \item{\code{hizb_quarter}}{Maqra}
#'   \item{\code{sajda}}{Binary indicator for presence of a sajdah}
#'   \item{\code{sajda_id}}{Unique id number for the sajdah}
#'   \item{\code{sajda_recommended}}{Binary indicator for whether a sajdah is recommended}
#'   \item{\code{sajda_obligatory}}{Binary indicator for whether a sajdah is obligatory}
#' }
#'
#' @examples
#' # See first few rows
#' head(quran_en_yusufali)
#'
#' # How many ayahs are in each surah?
#' library(dplyr)
#'
#' quran_en_yusufali %>%
#'   group_by(surah_title_en) %>%
#'   summarize(total_ayaat = n())
"quran_en_yusufali"

#' The Saheeh International translation of the Qur'an (English)
#'
#' A dataset containing the English text of the Saheeh International translation of the Qur'an.
#'
#' Because Surahs 89 and 113 are both translated as "The Dawn," Surah 113 has
#' been retitled "The Daybreak"
#'
#' @source Tanzil (\url{http://tanzil.net/docs/download}) and Al Quran Cloud (\url{https://alquran.cloud/})
#' @format A data frame with 6236 rows and 18 columns:
#' \describe{
#'   \item{\code{surah_id}}{Unique id number for the surah}
#'   \item{\code{ayah_id}}{Unique id number for the ayah}
#'   \item{\code{surah_title_ar}}{Name of the surah (Arabic)}
#'   \item{\code{surah_title_en}}{Name of the surah (English; transliterated)}
#'   \item{\code{surah_title_en_trans}}{Name of the surah (English; translated)}
#'   \item{\code{revelation_type}}{Type of the surah (Meccan or Medinan)}
#'   \item{\code{text}}{Ayah text}
#'   \item{\code{surah}}{Surah}
#'   \item{\code{ayah}}{Ayah}
#'   \item{\code{ayah_title}}{Combined surah and ayah (e.g. 2:242)}
#'   \item{\code{juz}}{Juz'}
#'   \item{\code{manzil}}{Manzil}
#'   \item{\code{page}}{Page number}
#'   \item{\code{hizb_quarter}}{Maqra}
#'   \item{\code{sajda}}{Binary indicator for presence of a sajdah}
#'   \item{\code{sajda_id}}{Unique id number for the sajdah}
#'   \item{\code{sajda_recommended}}{Binary indicator for whether a sajdah is recommended}
#'   \item{\code{sajda_obligatory}}{Binary indicator for whether a sajdah is obligatory}
#' }
#'
#' @examples
#' # See first few rows
#' head(quran_en_sahih)
#'
#' # How many ayahs are in each surah?
#' library(dplyr)
#'
#' quran_en_sahih %>%
#'   group_by(surah_title_en) %>%
#'   summarize(total_ayaat = n())
"quran_en_sahih"
