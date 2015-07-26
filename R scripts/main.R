training_input <- scan("training_input.txt")
training_target<- scan("training_target.txt")
testing_input<- scan("testing_input.txt")
training_input <- circular(training_input, unit = "radians")
training_target <- circular(training_target, unit = "radians")
testing_input <- circular(testing_input, unit = "radians")
bw_LL <- bw.reg.circ.circ(training_input, training_target, method = "LL")
bw_NW <- bw.reg.circ.circ(training_input, training_target, method = "NW")
estNW <- kern.reg.circ.circ(training_input, training_target, t=NULL, bw = bw_NW, method = "NW"); estNW
estLL <- kern.reg.circ.circ(training_input, training_target, t=NULL, bw = bw_LL, method = "LL"); estLL
plot(estNW, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "radians")
lines(estLL, plot.type = "circle", line.col = 3, lwd = 2)
plot(estNW, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, xlab = "training_input", ylab = "training_target")
lines(estLL, plot.type = "line", line.col = 3, lwd = 2)


training_input <- scan("training_input.txt")
training_target_noisy<- scan("training_target_noisy.txt")
testing_input<- scan("testing_input.txt")
training_input <- circular(training_input, unit = "radians")
training_target_noisy <- circular(training_target_noisy, unit = "radians")
testing_input <- circular(testing_input, unit = "radians")
bw_LL_noisy <- bw.reg.circ.circ(training_input, training_target_noisy, method = "LL")
bw_NW_noisy <- bw.reg.circ.circ(training_input, training_target_noisy, method = "NW")
estNW_noisy <- kern.reg.circ.circ(training_input, training_target_noisy, t=NULL, bw = bw_NW_noisy, method = "NW"); estNW_noisy
estLL_noisy <- kern.reg.circ.circ(training_input, training_target_noisy, t=NULL, bw = bw_LL_noisy, method = "LL"); estLL_noisy
plot(estNW_noisy, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "radians")
lines(estLL_noisy, plot.type = "circle", line.col = 3, lwd = 2)
plot(estNW_noisy, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, xlab = "training_input", ylab = "training_target")
lines(estLL_noisy, plot.type = "line", line.col = 3, lwd = 2)
