library(animation)

dat <- read.table("kucc.dat")

N <- NROW(dat)

f <- function (t) {
    p <- dat[round((N-1)*t + 1), ]
    
    complex(real = p[1], imaginary = p[2])
}

n <- 100
coefs <- numeric(2*n+1)

delta <- 0.001
s <- seq(0, 1, by=delta)

for (i in -n:n) {
    value <- 0
    for (k in s) {
        value <- value + f(k) * exp(complex(imaginary = -i*2*pi*k)) * delta
    }
    coefs[n+1 + i] <- value
}

d2 <- Im(coefs)^2 + Re(coefs)^2

rk <- numeric(2*n+1)
rk[1] <- n+1
for (i in 1:n) {
    rk[2*i] <- n+i+1
    rk[2*i+1] <- n+1-i
}

fourier <- function (t) {
    location <- numeric(2*n+1)
    for (i in -n:n) {
        location[n+1 + i] <- coefs[n+1 + i] * exp(complex(imaginary = i*2*pi*t))
    }
    return (location)
}

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

for (i in seq(par('usr')[3], par('usr')[4], length = 100+1)) {
    i_next <- i + (par('usr')[4] - par('usr')[3])/100
    segments(i, h, i_next, h, col = "gray80")
    segments(v, i, v, i_next, col = "gray80")
    ani.record()
}

for (s in seq(0, 1, by=0.01)) {
    plot.new()
    plot.window(xlim = c(-5, 5), ylim = c(-5, 5))
    abline(h = h, col = "gray80")
    abline(v = v, col = "gray80")
    
    polygon(
        O(
            list(
                c = c(0, 0), 
                r = s * sqrt(d2[n+1])
            ), 
            t = seq(0, 1, by=0.01)
        ),
        col = rgb(0, 0, 0, 0.1),
        border = NA
    )
    
    ani.record()
}

for (i in 1:10) {
    ani.record()
}

drawPoly <- function (n) {
    
    plot.new()
    plot.window(xlim = c(-5, 5), ylim = c(-5, 5))
    abline(h = h, col = "gray80")
    abline(v = v, col = "gray80")
    
    loc <- fourier(0.005)[rk]
    xy <- c(0 + 0i, cumsum(loc))
    
    for (i in seq_len(n)) {
        polygon(
            O(
                list(c = c(Re(xy[i]), Im(xy[i])), 
                    r = sqrt(d2)[rk][i]
                ), 
                t = seq(0, 1, length = 100+1)
            ),
            col = rgb(0, 0, 0, 0.1),
            border = NA
        )
    }
}



loc <- fourier(0.005)[rk]
xy <- c(0 + 0i, cumsum(loc))

for (i in 1:(n/4)) {
    for (s in seq(0, 1, length = round(100/i)+1)) {
        drawPoly(i)
        polygon(
            O(
                list(c = c(
                    Re(xy[i+1]), Im(xy[i+1])), r = s * sqrt(d2)[rk][i+1]
                ), 
                t = seq(0, 1, length = round(100/i)+1)
            ),
            col = rgb(0, 0, 0, 0.1),
            border = NA
        )
        ani.record()
    }
}

for (i in 1:n) {
    k <- L(
        rbind(
            c(Re(xy[i]), Im(xy[i])),
            c(Re(xy[i+1]), Im(xy[i+1]))
        ), 
        seq(0, 1, length = round(100/i)+1)
    )
    for (j in 1:(NROW(k)-1)) {
        lines(
            k[c(j, j+1), 1],
            k[c(j, j+1), 2]
        )
        ani.record()
    }
}

for (i in (n+1):round(1.5*n)) {
    k <- L(
        rbind(
            c(Re(xy[i]), Im(xy[i])),
            c(Re(xy[i+1]), Im(xy[i+1]))
        ), 
        seq(0, 1, length = 2)
    )
    for (j in 1:(NROW(k)-1)) {
        lines(
            k[c(j, j+1), 1],
            k[c(j, j+1), 2]
        )
        
        if (i %% 2 == 0) {
            ani.record()
        }
    }
}

for (i in round(1.5*n+1):(2*n)) {
    k <- L(
        rbind(
            c(Re(xy[i]), Im(xy[i])),
            c(Re(xy[i+1]), Im(xy[i+1]))
        ), 
        seq(0, 1, length = 2)
    )
    for (j in 1:(NROW(k)-1)) {
        lines(
            k[c(j, j+1), 1],
            k[c(j, j+1), 2]
        )
        
        if (i %% 4 == 0) {
            ani.record()
        }
    }
}

delta <- 0.0025
for (t in seq(0.01, 0.99, by=delta)) {
    plot.new()
    plot.window(c(-5, 5), c(-5, 5))
    
    abline(h = c(-6, -4, -2, 0, 2, 4, 6), col = "gray80")
    abline(v = c(-6, -4, -2, 0, 2, 4, 6), col = "gray80")
    
    lines(dat[round((N-1)*0.005 + 1):round((N-1)*t + 1), ])
    
    loc <- fourier(t)[rk]
    xy <- c(0 + 0i, cumsum(loc))
    
    lines(xy)
    
    for (i in 1:(2*n+1)) {
        polygon(
            O(
                list(c = c(
                    Re(xy[i]), Im(xy[i])), r = sqrt(d2)[rk][i]
                ), 
                t = seq(0, 1, by=0.01)
            ),
            col = rgb(0, 0, 0, 0.1),
            border = NA
        )
    }
    
    ani.record()
}

lines(dat[1:round((N-1)*0.005), ])
for (i in 1:10) {
    ani.record()
}

ani.options(interval = 0.025)
ani.options(ffmpeg = "C:\\Program Files\\ImageMagick-7.1.1-Q16-HDRI\\ffmpeg.exe")
saveVideo(ani.replay(), video.name = "test2.mp4")
