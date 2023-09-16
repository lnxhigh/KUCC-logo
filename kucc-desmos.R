source("kucc-data.R")

par(
    pty = 's',
    family = "mono",
    bg = "ghostwhite",
    mar = c(3, 3, 3, 3)
)

plot.new()
plot.window(c(-5, 5), c(-5, 5))

abline(h = c(-6, -4, -2, 0, 2, 4, 6), col = "gray80")
abline(v = c(-6, -4, -2, 0, 2, 4, 6), col = "gray80")

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

polygon(
    rbind(
        O(clist[[2]], t[692:409 + 1]),
        O(clist[[4]], t[412:696 + 1])
    ),
    col = "#FFFFFF66", border = NA
)


polygon(
    rbind(
        O(clist[[5]], t[1:501]),
        O(clist[[6]], t[501:1000])
    ),
    col = "#C7444066", border = NA
)

polygon(
    rbind(
        O(clist[[7]], t[1:501]),
        O(clist[[8]], t[501:1000])
    ),
    col = "#C7444066", border = NA
)
