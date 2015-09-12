	training_input <- scan("training_input_face_6.txt")
	training_target<- scan("training_target_face_6.txt")
	testing_input<- scan("testing_input_face_6.txt")

	training_input <- circular(training_input, unit = "radians")
	training_target <- circular(training_target, unit = "radians")
	testing_input <- circular(testing_input, unit = "radians")

	bw_LL <- bw.reg.circ.circ(training_input, training_target, method = "LL")
	bw_NW <- bw.reg.circ.circ(training_input, training_target, method = "NW")
	estNW <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_NW, method = "NW"); estNW
	estLL <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_LL, method = "LL"); estLL

	plot(estNW, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees")
	lines(estLL, plot.type = "circle", line.col = 3, lwd = 2)

	plot(estNW, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees", points.pch = "*")
	lines(estLL, plot.type = "line", line.col = 3, lwd = 2, units = "degrees")




	test = estNW["y"]
	test.df = as.data.frame(do.call(cbind, test))
	write.csv(test.df, file = "testing_predicted_face_6.csv")



	training_input <- scan("training_input_face_5.txt")
	training_target<- scan("training_target_face_5.txt")
	testing_input<- scan("testing_input_face_5.txt")

	training_input <- circular(training_input, unit = "radians")
	training_target <- circular(training_target, unit = "radians")
	testing_input <- circular(testing_input, unit = "radians")

	bw_LL <- bw.reg.circ.circ(training_input, training_target, method = "LL")
	bw_NW <- bw.reg.circ.circ(training_input, training_target, method = "NW")
	estNW <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_NW, method = "NW"); estNW
	estLL <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_LL, method = "LL"); estLL

	plot(estNW, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees")
	lines(estLL, plot.type = "circle", line.col = 3, lwd = 2)

	plot(estNW, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees", points.pch = "*")
	lines(estLL, plot.type = "line", line.col = 3, lwd = 2, units = "degrees")




	test = estNW["y"]
	test.df = as.data.frame(do.call(cbind, test))
	write.csv(test.df, file = "testing_predicted_face_5.csv")

	training_input <- scan("training_input_face_4.txt")
	training_target<- scan("training_target_face_4.txt")
	testing_input<- scan("testing_input_face_4.txt")

	training_input <- circular(training_input, unit = "radians")
	training_target <- circular(training_target, unit = "radians")
	testing_input <- circular(testing_input, unit = "radians")

	bw_LL <- bw.reg.circ.circ(training_input, training_target, method = "LL")
	bw_NW <- bw.reg.circ.circ(training_input, training_target, method = "NW")
	estNW <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_NW, method = "NW"); estNW
	estLL <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_LL, method = "LL"); estLL

	plot(estNW, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees")
	lines(estLL, plot.type = "circle", line.col = 3, lwd = 2)

	plot(estNW, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees", points.pch = "*")
	lines(estLL, plot.type = "line", line.col = 3, lwd = 2, units = "degrees")




	test = estNW["y"]
	test.df = as.data.frame(do.call(cbind, test))
	write.csv(test.df, file = "testing_predicted_face_4.csv")

	training_input <- scan("training_input_face_3.txt")
	training_target<- scan("training_target_face_3.txt")
	testing_input<- scan("testing_input_face_3.txt")

	training_input <- circular(training_input, unit = "radians")
	training_target <- circular(training_target, unit = "radians")
	testing_input <- circular(testing_input, unit = "radians")

	bw_LL <- bw.reg.circ.circ(training_input, training_target, method = "LL")
	bw_NW <- bw.reg.circ.circ(training_input, training_target, method = "NW")
	estNW <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_NW, method = "NW"); estNW
	estLL <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_LL, method = "LL"); estLL

	plot(estNW, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees")
	lines(estLL, plot.type = "circle", line.col = 3, lwd = 2)

	plot(estNW, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees", points.pch = "*")
	lines(estLL, plot.type = "line", line.col = 3, lwd = 2, units = "degrees")




	test = estNW["y"]
	test.df = as.data.frame(do.call(cbind, test))
	write.csv(test.df, file = "testing_predicted_face_3.csv")

	training_input <- scan("training_input_face_2.txt")
	training_target<- scan("training_target_face_2.txt")
	testing_input<- scan("testing_input_face_2.txt")

	training_input <- circular(training_input, unit = "radians")
	training_target <- circular(training_target, unit = "radians")
	testing_input <- circular(testing_input, unit = "radians")

	bw_LL <- bw.reg.circ.circ(training_input, training_target, method = "LL")
	bw_NW <- bw.reg.circ.circ(training_input, training_target, method = "NW")
	estNW <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_NW, method = "NW"); estNW
	estLL <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_LL, method = "LL"); estLL

	plot(estNW, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees")
	lines(estLL, plot.type = "circle", line.col = 3, lwd = 2)

	plot(estNW, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees", points.pch = "*")
	lines(estLL, plot.type = "line", line.col = 3, lwd = 2, units = "degrees")




	test = estNW["y"]
	test.df = as.data.frame(do.call(cbind, test))
	write.csv(test.df, file = "testing_predicted_face_2.csv")

training_input <- scan("training_input_face_1.txt")
	training_target<- scan("training_target_face_1.txt")
	testing_input<- scan("testing_input_face_1.txt")

	training_input <- circular(training_input, unit = "radians")
	training_target <- circular(training_target, unit = "radians")
	testing_input <- circular(testing_input, unit = "radians")

	bw_LL <- bw.reg.circ.circ(training_input, training_target, method = "LL")
	bw_NW <- bw.reg.circ.circ(training_input, training_target, method = "NW")
	estNW <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_NW, method = "NW"); estNW
	estLL <- kern.reg.circ.circ(training_input, training_target, t=testing_input, bw = bw_LL, method = "LL"); estLL

	plot(estNW, plot.type = "circle", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees")
	lines(estLL, plot.type = "circle", line.col = 3, lwd = 2)

	plot(estNW, plot.type = "line", points.plot = TRUE, line.col = 2, lwd = 2, points.col = 1, units = "degrees", points.pch = "*")
	lines(estLL, plot.type = "line", line.col = 3, lwd = 2, units = "degrees")




	test = estNW["y"]
	test.df = as.data.frame(do.call(cbind, test))
	write.csv(test.df, file = "testing_predicted_face_1.csv")

