library(animation)
source("kucc-data.R")

ani.options(interval = 0.05)
ani.options(ffmpeg = "C:\\Program Files\\ImageMagick-7.1.1-Q16-HDRI\\ffmpeg.exe")

setwd("C:\\Users\\User\\Desktop\\R\\Portfolio\\KUCC")

ani.options(interval = 0.05)
ani.options(ffmpeg = "C:\\Program Files\\ImageMagick-7.1.1-Q16-HDRI\\ffmpeg.exe")

par(
    pty = 's',
    family = "mono",
    bg = "ghostwhite",
    mar = c(3, 3, 3, 3)
)
   
ani.record(reset = TRUE)

plot.new()
plot.window(c(-5, 5), c(-5, 5))

h <- c(-4, -2, 0, 2, 4)
v <- c(-4, -2, 0, 2, 4)

for (i in seq(par('usr')[3], par('usr')[4], length = 50+1)) {
    i_next <- i + (par('usr')[4] - par('usr')[3])/50
    segments(i, h, i_next, h, col = "gray80")
    segments(v, i, v, i_next, col = "gray80")
    ani.record()
}

for (i in seq(par('usr')[3], par('usr')[4], length = 25+1)) {
    i_next <- i + (par('usr')[4] - par('usr')[3])/25
    segments(i, 0, i_next, 0, col = "gray10", lwd = 2)
    segments(0, i, 0, i_next, col = "gray10", lwd = 2)
    
    if ((i <= -4 && i_next > -4) || (i <= -2 && i_next > -2) || 
            (i <= 2 && i_next >= 2) || (i <= 4 && i_next > 4)) {
        text(ceiling(i), 0, labels = ceiling(i), cex = 1, pos = 1)
        text(0, ceiling(i), labels = ceiling(i), cex = 1, pos = 2)
    }
    if (i <= 0 && i_next > 0) {
        text(0, 0, labels = 0, cex = 1, adj = c(2, 2))
    }
    
    ani.record()
}

points(clist[[1]]$c[1], clist[[1]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 2.5)
for (i in 1:2) {
    ani.record()
    ani.pause()
}

k <- O(clist[[1]], t)
for (i in 1:(length(t)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points(clist[[2]]$c[1], clist[[2]]$c[2], pch = 18, col = 1, cex = 1.5)
for (i in 1:2) {
    ani.record()
    ani.pause()
}

k <- O(clist[[2]], t)
for (i in 1:(length(t)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points(clist[[3]]$c[1], clist[[3]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 1.5)
points(clist[[3]]$c[1], clist[[3]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 2.5)
for (i in 1:2) {
    ani.record()
    ani.pause()
}

k <- O(clist[[3]], t)
for (i in 1:(length(t)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2 <- function (m, col) {
    points(m, 
        pch = 18, cex = 1,
        col = col,
    )
    points(m, 
        pch = 18, cex = 2,
        col = paste0(col, "66"),
    )
}

points2(m[[1]][6:4, ], "#6042A6")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-5.5, 2, length = 1000 + 1)
k <- Q(m[[1]][6:4, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2(m[[1]][1:3, ], "#6042A6")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-1, 4, length = 1000 + 1)
k <- Q(m[[1]][1:3, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2(m[[2]][10:7, ], "#C74440")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-1, 2, length = 1000 + 1)
k <- C(m[[2]][10:7, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2(m[[4]][6:9, ], "#2D70B3")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-2, 3, length = 1000 + 1)
k <- C(m[[4]][6:9, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2(m[[4]][3:6, ], "#2D70B3")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-2, 4, length = 1000 + 1)
k <- C(m[[4]][3:6, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2(m[[2]][4:1, ], col ="#C74440")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-2, 2, length = 1000 + 1)
k <- C(m[[2]][4:1, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2(m[[3]][1:4, ], col = "#388C46")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-2, 3, length = 1000 + 1)
k <- C(m[[3]][1:4, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

points2(m[[3]][4:7, ], col = "#388C46")
for (i in 1:2) {
    ani.record()
    ani.pause()
}

s <- seq(-2, 3, length = 1000 + 1)
k <- C(m[[3]][4:7, ], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

# points2(m[[2]][6:4, ], col = "#C74440")
# points2(m[[3]][7:9, ], col = "#388C46")
# points2(m[[4]][1:3, ], col = "#2D70B3")

# saveVideo(ani.replay(), "test.mp4")

polygon(
    rbind(
        Q(m[[1]][1:3, ], t), 
        Q(m[[1]][6:4, ], t)
    ),
    col = "#6042A666", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

polygon(
    rbind(
        O(list(c = c(0.9177, 1.3935), r = sqrt(8.98)), t[845:701 %% 1001 + 1]),
        c(0, m[[1]][6, 2])
    ),
    col = "#388C4666", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

polygon(
    rbind(
        O(clist[[1]], t[700:1094 %% 1001 + 1]),
        O(clist[[2]], t[1101:692 %% 1001 + 1])
    ), col = "#2D70B366", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

polygon(
    rbind(
        C(m[[2]][10:7, ], t),
        Q(m[[4]][1:3, ], t),
        C(m[[4]][3:6, ], t),
        C(m[[4]][6:9, ], t)
    ),
    col = "#C7444066", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

polygon(
    rbind(
        O(clist[[1]], t[189:294 + 1]),
        O(clist[[2]], t[303:183 + 1])
    ),
    col = "#FA7E1966", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

polygon(
    rbind(
        Q(m[[2]][6:4, ], t),
        C(m[[2]][4:1, ], t),
        C(m[[3]][1:4, ], t),
        C(m[[3]][4:7, ], t),
        Q(m[[3]][7:9, ], t)
    ),
    col = "#388C4666", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

polygon(
    rbind(
        O(clist[[3]], t[316:769 + 1]),
        O(clist[[2]], t[692:409 + 1])
    ),
    col = "#C7444066", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

points(clist[[4]]$c[1], clist[[4]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 1)
points(clist[[4]]$c[1], clist[[4]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 2)
for (i in 1:2) {
    ani.record()
    ani.pause()
}


s <- seq(0.3, 0.8, length = 500 + 1)
k <- O(clist[[4]], s)
for (i in 1:(length(s)-1)) {
    lines(k[c(i, i+1), 1], k[c(i, i+1), 2])
    if (i %% 30 == 0) {
        ani.record()
    }
}

polygon(
    rbind(
        O(clist[[2]], t[692:409 + 1]),
        O(clist[[4]], t[412:696 + 1])
    ),
    col = "#FFFFFF66", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

# Whole drawing

plot.new()
plot.window(c(-5, 5), c(-5, 5))

abline(h = c(-6, -4, -2, 0, 2, 4, 6), col = "gray80")
abline(v = c(-6, -4, -2, 0, 2, 4, 6), col = "gray80")
abline(h = 0, lwd = 2, col = "gray10")
abline(v = 0, lwd = 2, col = "gray10")

a <- c(-6, -4, -2, 2, 4, 6)
text(a, 0, labels = a, cex = 1, pos = 1)
text(0, a, labels = a, cex = 1, pos = 2)
text(0, 0, labels = 0, cex = 1, adj = c(2, 2))

polygon(
    rbind(
        Q(m[[1]][1:3, ], t), 
        Q(m[[1]][6:4, ], t)
    ),
    col = "#6042A666", border = NA
)
polygon(
    rbind(
        O(clist[[1]], t[845:701 %% 1001 + 1]),
        c(0, m[[1]][6, 2])
    ),
    col = "#388C4666", border = NA
)
polygon(
    rbind(
        O(clist[[1]], t[700:1094 %% 1001 + 1]),
        O(clist[[2]], t[1101:692 %% 1001 + 1])
    ), col = "#2D70B366", border = NA
)
polygon(
    rbind(
        C(m[[2]][10:7, ], t),
        Q(m[[4]][1:3, ], t),
        C(m[[4]][3:6, ], t),
        C(m[[4]][6:9, ], t)
    ),
    col = "#C7444066", border = NA
)
polygon(
    rbind(
        O(clist[[1]], t[189:294 + 1]),
        O(clist[[2]], t[303:183 + 1])
    ),
    col = "#FA7E1966", border = NA
)
polygon(
    rbind(
        Q(m[[2]][6:4, ], t),
        C(m[[2]][4:1, ], t),
        C(m[[3]][1:4, ], t),
        C(m[[3]][4:7, ], t),
        Q(m[[3]][7:9, ], t)
    ),
    col = "#388C4666", border = NA
)
polygon(
    rbind(
        O(clist[[3]], t[316:769 + 1]),
        O(clist[[2]], t[692:409 + 1])
    ),
    col = "#C7444066", border = NA
)
polygon(
    rbind(
        O(clist[[2]], t[692:409 + 1]),
        O(clist[[4]], t[412:696 + 1])
    ),
    col = "#FFFFFF66", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
        ani.pause()
    }
}

# Eye

polygon(
    rbind(
        O(clist[[5]], t[1:501]),
        O(clist[[6]], t[501:1000])
    ),
    col = "#C7444066", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
    }
}

polygon(
    rbind(
        O(clist[[7]], t[1:501]),
        O(clist[[8]], t[501:1000])
    ),
    col = "#C7444066", border = NA
)

for (i in 1:1000) {
    if (i %% 50 == 0) {
        ani.record()
    }
}

saveVideo(ani.replay(), "test.mp4")

# ani.options(interval = 0.01)
# ani.replay()
# saveGIF(ani.replay(), movie.name = "desmos.gif", width = 1000, height = 1000)
