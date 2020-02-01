## Use this code to initiate your devstuff file
# usethis::use_data_raw("devstuff")

# Put this into your .Rprofile
usethis::use_description(fields = list(
    # Package = "colormind", # default, no need to specify
    # Version = "0.0.0.9000", # default, no need to specify
    Title = "Generate Color Palettes With AI",
    Description = "Use colormind.io API to generate aesthetically pleasing color palettes.",
    `Authors@R` = 'c(person("Dmytro", "Perepolkin",
                   email = "dperepolkin@gmail.com", role = c("aut", "cre"),
                          comment = c(ORCID = "0000-0001-8558-6183")))',
    # License = "MIT + file LICENSE", # will add via separate command
    # Encoding = "UTF-8", # default, no need to specify
    # LazyData = "true" # default, no need to specify
    URL = "https://github.com/dmi3kno/colormind",
    BugReports = "https://github.com/dmi3kno/colormind/issues",
    Language =  "en" # keep last
  )
)
usethis::use_mit_license("Dmytro Perepolkin")
usethis::use_readme_rmd()
usethis::use_lifecycle_badge("Experimental")
usethis::use_news_md()
#usethis::use_travis()
#usethis::use_appveyor()
#usethis::use_pkgdown()
#usethis::use_pkgdown_travis()
