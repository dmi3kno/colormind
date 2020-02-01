library(magick)
library(bunny)

clrmd <- image_read_svg("http://colormind.io/img/logo_nav.svg", 1600, 1600)

bg_color <- "#191919"
bg_color2 <- "#2d2d2d"
fg_color <- "gray60"

pkgtxt <- image_blank(1500,300, "transparent") %>%
  image_annotate("colormind", gravity = "center",
                 size=225, font="Quicksand", color = "white", weight = 400)

pkglogo <-
  image_blank(1600,1600, "transparent") %>%
  image_composite(clrmd, gravity = "center", offset = "+240-112", operator = "Over") %>%
  image_composite(pkgtxt, gravity = "center", offset = "+0-30", operator = "Exclusion")

clrmd_hex <-
  image_canvas_hex(fill_color = bg_color, border_color = fg_color) %>%
  image_compose(pkglogo, gravity = "center") %>%
  image_composite(image_canvas_hexborder(border_color = fg_color, border_size = 5),
                  gravity = "center", operator = "Atop")

clrmd_hex %>% image_scale("50%")

clrmd_hex %>%
  image_scale("1200x1200") %>%
  image_write("data-raw/clrmd_hex.png", density = 600)

clrmd_hex %>%
  image_scale("200x200") %>%
  image_write("man/figures/logo.png", density = 600)

clrmd_hex_gh <- clrmd_hex %>%
  image_scale("480x480")

gh_logo <- bunny::github %>%
  image_negate() %>%
  image_scale("50x50")

clrmd_ghcard <-
  image_canvas_ghcard(fill_color = bg_color2) %>%
  image_composite(clrmd_hex_gh, gravity = "East", offset = "+100+0") %>%
  image_annotate("What color are you?", gravity = "West", location = "+60-30",
                 color="white", size=55, font="Aller", weight = 400) %>%
  image_compose(gh_logo, gravity="West", offset = "+60+40") %>%
  image_annotate("dmi3kno/colormind", gravity="West", color=fg_color,
                 location="+120+45", size=50, font="Ubuntu Mono") %>%
  image_border_ghcard(bg_color2)

clrmd_ghcard %>%
  image_write("data-raw/clrmd_ghcard.png", density = 600)




