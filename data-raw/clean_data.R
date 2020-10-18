library(dplyr)
library(tidyr)
library(stringr)
library(purrr)
library(readr)
library(jsonlite)


# Download raw data from alquran.cloud ------------------------------------

# Arabic, all vowels
download.file("http://api.alquran.cloud/quran/quran-simple",
              "./data-raw/quran-simple.json")
quran_ar_raw <- read_json("./data-raw/quran-simple.json")

# Arabic, no vowels
download.file("http://api.alquran.cloud/quran/quran-simple-clean",
              "./data-raw/quran-simple-clean.json")
quran_clean_ar_raw <- read_json("./data-raw/quran-simple-clean.json")

# English, Yusuf Ali
download.file("http://api.alquran.cloud/quran/en.yusufali",
              "./data-raw/en.yusufali.json")
quran_en_yusufali_raw <- read_json("./data-raw/en.yusufali.json")

# English, Saheeh International
download.file("http://api.alquran.cloud/quran/en.sahih",
              "./data-raw/en.sahih.json")
quran_en_sahih_raw <- read_json("./data-raw/en.sahih.json")


download.file('https://bigdata-ir.com/wp-content/uploads/2018/07/ترجمه-فارسی-قرآن-آقای-قرائتی.txt','./data-raw/quran_farsi.txt')

quran_fa_qaraati_raw <- read_delim('data-raw/quran_farsi.txt',delim = '|',col_names = c('surah_id' ,'ayah_id','text' ))
# Load and clean raw data -------------------------------------------------

# There are 15 sajdas, and each has additional metadata (like whether it is is
# recommended or obligatory) that is in a nested list. If we just use
# as_data_frame(), ayahs with sajdas turn into a three-row data frame that can't
# be bound with the sajda-free ayahs. So, we have to treat sajda ayahs a little
# differently, flattening them and renaming some of the columns
extract_ayahs <- function(x) {
  n_sajda <- length(x$sajda)

  if (n_sajda == 1) {
    as_data_frame(x)
  } else {
    as_data_frame(purrr::flatten(x)) %>%
      mutate(sajda = TRUE) %>%
      rename(sajda_id = id, sajda_recommended = recommended,
             sajda_obligatory = obligatory)
  }
}

# Extract all the surah and ayah details
quran_ar <- data_frame(surah_id = 1:114) %>%
  mutate(surah_details =
           map(surah_id, ~ as_data_frame(quran_ar_raw$data$surahs[[.x]]))) %>%
  unnest(surah_details) %>%
  mutate(ayahs = ayahs %>% map(~ extract_ayahs(.x))) %>%
  unnest(ayahs) %>%
  mutate(ayah_title = paste0(surah_id, ":", numberInSurah),
         surah = surah_id) %>%
  select(surah_id, ayah_id = number1,
         surah_title_ar = name, surah_title_en = englishName,
         surah_title_en_trans = englishNameTranslation,
         revelation_type = revelationType,
         text, surah, ayah = numberInSurah, ayah_title,
         juz, manzil, page, hizb_quarter = hizbQuarter,
         sajda, sajda_id, sajda_recommended, sajda_obligatory) %>%
  mutate(surah_title_ar = str_replace(surah_title_ar, "سورة ", "")) %>%
  # There are two "The Dawns" so make 113 Al-Falaq be "The Daybreak"
  mutate(surah_title_en_trans = ifelse(surah_id == 113, "The Daybreak", surah_title_en_trans)) %>%
  mutate_at(vars(surah_title_ar, surah_title_en, surah_title_en_trans),
            funs(forcats::fct_inorder))

quran_ar_min <- data_frame(surah_id = 1:114) %>%
  mutate(surah_details =
           map(surah_id, ~ as_data_frame(quran_clean_ar_raw$data$surahs[[.x]]))) %>%
  unnest(surah_details) %>%
  mutate(ayahs = ayahs %>% map(~ extract_ayahs(.x))) %>%
  unnest(ayahs) %>%
  mutate(ayah_title = paste0(surah_id, ":", numberInSurah),
         surah = surah_id) %>%
  select(surah_id, ayah_id = number1,
         surah_title_ar = name, surah_title_en = englishName,
         surah_title_en_trans = englishNameTranslation,
         revelation_type = revelationType,
         text, surah, ayah = numberInSurah, ayah_title,
         juz, manzil, page, hizb_quarter = hizbQuarter,
         sajda, sajda_id, sajda_recommended, sajda_obligatory) %>%
  mutate(surah_title_ar = str_replace(surah_title_ar, "سورة ", "")) %>%
  # There are two "The Dawns" so make 113 Al-Falaq be "The Daybreak"
  mutate(surah_title_en_trans = ifelse(surah_id == 113, "The Daybreak", surah_title_en_trans)) %>%
  mutate_at(vars(surah_title_ar, surah_title_en, surah_title_en_trans),
            funs(forcats::fct_inorder))

quran_en_yusufali <- data_frame(surah_id = 1:114) %>%
  mutate(surah_details =
           map(surah_id, ~ as_data_frame(quran_en_yusufali_raw$data$surahs[[.x]]))) %>%
  unnest(surah_details) %>%
  mutate(ayahs = ayahs %>% map(~ extract_ayahs(.x))) %>%
  unnest(ayahs) %>%
  mutate(ayah_title = paste0(surah_id, ":", numberInSurah),
         surah = surah_id) %>%
  select(surah_id, ayah_id = number1,
         surah_title_ar = name, surah_title_en = englishName,
         surah_title_en_trans = englishNameTranslation,
         revelation_type = revelationType,
         text, surah, ayah = numberInSurah, ayah_title,
         juz, manzil, page, hizb_quarter = hizbQuarter,
         sajda, sajda_id, sajda_recommended, sajda_obligatory) %>%
  mutate(surah_title_ar = str_replace(surah_title_ar, "سورة ", "")) %>%
  # There are two "The Dawns" so make 113 Al-Falaq be "The Daybreak"
  mutate(surah_title_en_trans = ifelse(surah_id == 113, "The Daybreak", surah_title_en_trans)) %>%
  mutate_at(vars(surah_title_ar, surah_title_en, surah_title_en_trans),
            funs(forcats::fct_inorder))

quran_en_sahih <- data_frame(surah_id = 1:114) %>%
  mutate(surah_details =
           map(surah_id, ~ as_data_frame(quran_en_sahih_raw$data$surahs[[.x]]))) %>%
  unnest(surah_details) %>%
  mutate(ayahs = ayahs %>% map(~ extract_ayahs(.x))) %>%
  unnest(ayahs) %>%
  mutate(ayah_title = paste0(surah_id, ":", numberInSurah),
         surah = surah_id) %>%
  select(surah_id, ayah_id = number1,
         surah_title_ar = name, surah_title_en = englishName,
         surah_title_en_trans = englishNameTranslation,
         revelation_type = revelationType,
         text, surah, ayah = numberInSurah, ayah_title,
         juz, manzil, page, hizb_quarter = hizbQuarter,
         sajda, sajda_id, sajda_recommended, sajda_obligatory) %>%
  mutate(surah_title_ar = str_replace(surah_title_ar, "سورة ", "")) %>%
  # There are two "The Dawns" so make 113 Al-Falaq be "The Daybreak"
  mutate(surah_title_en_trans = ifelse(surah_id == 113, "The Daybreak", surah_title_en_trans)) %>%
  mutate_at(vars(surah_title_ar, surah_title_en, surah_title_en_trans),
            funs(forcats::fct_inorder))

quran_fa_qaraati <- quran_fa_qaraati_raw%>%
  filter(!is.na(surah_id)) %>%
  bind_cols(quran_ar %>% select(-text,-surah_title_ar,-surah_id,-ayah_id))

# Add to package ----------------------------------------------------------

devtools::use_data(quran_ar, overwrite = TRUE)
devtools::use_data(quran_ar_min, overwrite = TRUE)
devtools::use_data(quran_en_yusufali, overwrite = TRUE)
devtools::use_data(quran_en_sahih, overwrite = TRUE)
devtools::use_data(quran_fa_qaraati, overwrite = TRUE)
