library(imager)

###
# url <- "https://lms.kucc.co.kr/img/logo/type-3-2.svg"
file <- "kucc.png"
img <- load.image(file)
img <- resize(img, size_x = 1000L, size_y = 1000L)

plot(img, axes = FALSE)

###
r <- 195; g <- 32; b <- 41
rgb_color <- rgb(r, g, b, maxColorValue = 255)

###
img <- grayscale(img)
img[ , , 1, 1] <- ifelse(img[ , , 1, 1] > 0.5, TRUE, FALSE)

plot(img, axes = FALSE)

###
w <- width(img); h <- height(img)
p <- 1 - sum(img[ , , 1, 1]) / (w * h)
density <- 0.005

vec <- as.vector(img[ , , 1, 1])
idx <- which(vec == 0)
sample_idx <- sample(idx, size = floor(density * w * h * p))

###
df <- data.frame(x = sample_idx %% w, y = w - sample_idx %/% w)
n <- NROW(df)

par(
    pty = 's', 
    las = 1, 
    pch = 18,
    mar = c(0, 1, 2, 1),
    bg = "ghostwhite", 
    xaxs = 'i', yaxs = 'i'
)

### 
plot.new()
plot.window(xlim = c(0, 1), ylim = c(0, 1))
box()
axis(side = 1, family = "mono")
axis(side = 2, family = "mono")
grid(lty = 1, col = "gray90"); box()
points(
    df$x / w, df$y / h,
    cex = 4^(rbeta(n, 2, 2)) - 0.5,
    col = ggplot2::alpha(rainbow(n), rbeta(n, 2, 2))
)

name <- c("K", "U", "C", "C")
for (i in seq_along(name)) {
    s <- paste0(strrep(" ", i-1), name[i], strrep(" ", 4-i))
    title(s, family = "mono", cex.main = 3, col.main = rainbow(4)[i])
}


###
library(dplyr)
library(ggplot2)
library(plotly)

df <- df %>% 
    mutate(
        color = rainbow(n()),
        size = 4^rbeta(n(), 2, 2) - 1,
        alpha = rbeta(n(), 2, 2),
        distance = sqrt(x^2 + y^2)
    )

library(fpc)
db <- dbscan(df[c("x", "y")], eps = 40)
body_idx <- which.max(table(db$cluster))

df <- df %>% 
    mutate(part = db$cluster) %>% 
    mutate(part = ifelse(part == body_idx, "body", "eye"))

p <- df %>% 
    ggplot(aes(x = x, y = y)) +
    geom_point(
        aes(color = distance, size = size, alpha = alpha, text = paste("part:", part)),
        shape = 18
    ) +
    theme_void() +
    theme(legend.position='none') +
    coord_equal() +
    scale_color_gradientn(colors = c(low = "#620000", mid = "#b80000", high = "#da3232"))


kucc <- ggplotly(p, height = 750) %>% 
    layout(
        xaxis = list(color = "white"),
        yaxis = list(color = "white")
    )

library(htmltools)
ui <- shiny::fluidPage(kucc)
save_html(ui, file = "kucc.html")

