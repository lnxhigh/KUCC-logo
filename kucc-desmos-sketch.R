source("kucc-data.R")

# Bezier curve

par(
    pty = 's',
    family = "mono",
    bg = "ghostwhite",
    mar = c(3, 3, 3, 3)
)

plot.new()
plot.window(c(-5, 5), c(-5, 5))

h <- c(-4, -2, 0, 2, 4)
v <- c(-4, -2, 0, 2, 4)

abline(h = h, v = v, col = "gray80")

points(clist[[1]]$c[1], clist[[1]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 2.5)
k <- O(clist[[1]], t)
lines(k)

points(clist[[2]]$c[1], clist[[2]]$c[2], pch = 18, col = 1, cex = 1.5)
k <- O(clist[[2]], t)
lines(k)

points(clist[[3]]$c[1], clist[[3]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 1.5)
points(clist[[3]]$c[1], clist[[3]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 2.5)
k <- O(clist[[3]], t)
lines(k)

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
s <- seq(-5.5, 2, length = 1000 + 1)
k <- Q(m[[1]][6:4, ], s)
lines(k)

points2(m[[1]][1:3, ], "#6042A6")
s <- seq(-1, 4, length = 1000 + 1)
k <- Q(m[[1]][1:3, ], s)
lines(k)

points2(m[[2]][10:7, ], "#C74440")
s <- seq(-1, 2, length = 1000 + 1)
k <- C(m[[2]][10:7, ], s)
lines(k)

points2(m[[4]][6:9, ], "#2D70B3")
s <- seq(-2, 3, length = 1000 + 1)
k <- C(m[[4]][6:9, ], s)
lines(k)

points2(m[[4]][3:6, ], "#2D70B3")
s <- seq(-2, 4, length = 1000 + 1)
k <- C(m[[4]][3:6, ], s)
lines(k)

points2(m[[2]][4:1, ], col ="#C74440")
s <- seq(-2, 2, length = 1000 + 1)
k <- C(m[[2]][4:1, ], s)
lines(k)

points2(m[[3]][1:4, ], col = "#388C46")
s <- seq(-2, 3, length = 1000 + 1)
k <- C(m[[3]][1:4, ], s)
lines(k)

points2(m[[3]][4:7, ], col = "#388C46")
s <- seq(-2, 3, length = 1000 + 1)
k <- C(m[[3]][4:7, ], s)
lines(k)

# points2(m[[2]][6:4, ], col = "#C74440")
# points2(m[[3]][7:9, ], col = "#388C46")
# points2(m[[4]][1:3, ], col = "#2D70B3")

polygon(
    rbind(
        Q(m[[1]][1:3, ], t), 
        Q(m[[1]][6:4, ], t)
    ),
    col = "#6042A666", border = NA
)

polygon(
    rbind(
        O(list(c = c(0.9177, 1.3935), r = sqrt(8.98)), t[845:701 %% 1001 + 1]),
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

points(clist[[4]]$c[1], clist[[4]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 1)
points(clist[[4]]$c[1], clist[[4]]$c[2], pch = 18, col = rgb(0, 0, 0, 0.4), cex = 2)

s <- seq(0.3, 0.8, length = 500 + 1)
k <- O(clist[[4]], s)
lines(k)

polygon(
    rbind(
        O(clist[[2]], t[692:409 + 1]),
        O(clist[[4]], t[412:696 + 1])
    ),
    col = "#FFFFFF66", border = NA
)
