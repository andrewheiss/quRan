# tests for the Qur'an data

context("Tidy dataframe with Qur'an text")

suppressPackageStartupMessages(library(dplyr))

test_that("factor order is correct", {
  expect_equal(levels(quran_ar$surah_title_en)[1], "Al-Faatiha")
  expect_equal(levels(quran_ar$surah_title_en_trans)[1], "The Opening")
  expect_equal(levels(quran_ar$surah_title_ar)[1], "الفاتحة")

  expect_equal(levels(quran_ar$surah_title_en)[114], "An-Naas")
  expect_equal(levels(quran_ar$surah_title_en_trans)[114], "Mankind")
  expect_equal(levels(quran_ar$surah_title_ar)[114], "الناس")
})

test_that("tidy frame for the Qu'ran in Arabic is right", {
  # Does this have the right number of lines?
  expect_equal(nrow(quran_ar), 6236)
  expect_equal(ncol(quran_ar), 18)

  # Are the lines spread across each volume correctly?
  surahs_test <- quran_ar %>%
    group_by(surah_title_en) %>%
    summarise(total_ayahs = n())
  expect_equal(nrow(surahs_test), 114)
  expect_equal(ncol(surahs_test), 2)
})
