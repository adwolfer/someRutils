context('plot_NMR_spectra_pval_stocsy()')


## Input data (2.95 - 3.5 ppm)
inputPPM  <- someRutils::exampleNMR$ppm[711:821]
inputData <- someRutils::exampleNMR$data[,711:821]

## Expected
# 3 spectra plot
tmp_var_3sp   <- c(2.9522, 2.9522, 2.9522, 2.9573, 2.9573, 2.9573, 2.9623, 2.9623, 2.9623, 2.9672, 2.9672, 2.9672, 2.9722, 2.9722, 2.9722, 2.9773, 2.9773, 2.9773, 2.9823, 2.9823, 2.9823, 2.9872, 2.9872, 2.9872, 2.9922, 2.9922, 2.9922, 2.9973, 2.9973, 2.9973, 3.0023, 3.0023, 3.0023, 3.0072, 3.0072, 3.0072, 3.0123, 3.0123, 3.0123, 3.0172, 3.0172, 3.0172, 3.0223, 3.0223, 3.0223, 3.0272, 3.0272, 3.0272, 3.0323, 3.0323, 3.0323, 3.0372, 3.0372, 3.0372, 3.0423, 3.0423, 3.0423, 3.0472, 3.0472, 3.0472, 3.0522, 3.0522, 3.0522, 3.0573, 3.0573, 3.0573, 3.0622, 3.0622, 3.0622, 3.0673, 3.0673, 3.0673, 3.0723, 3.0723, 3.0723, 3.0772, 3.0772, 3.0772, 3.0823, 3.0823, 3.0823, 3.0873, 3.0873, 3.0873, 3.0922, 3.0922, 3.0922, 3.0972, 3.0972, 3.0972, 3.1023, 3.1023, 3.1023, 3.1073, 3.1073, 3.1073, 3.1122, 3.1122, 3.1122, 3.1172, 3.1172, 3.1172, 3.1223, 3.1223, 3.1223, 3.1273, 3.1273, 3.1273, 3.1322, 3.1322, 3.1322, 3.1373, 3.1373, 3.1373, 3.1422, 3.1422, 3.1422, 3.1473, 3.1473, 3.1473, 3.1522, 3.1522, 3.1522, 3.1573, 3.1573, 3.1573, 3.1622, 3.1622, 3.1622, 3.1673, 3.1673, 3.1673, 3.1722, 3.1722, 3.1722, 3.1772, 3.1772, 3.1772, 3.1823, 3.1823, 3.1823, 3.1872, 3.1872, 3.1872, 3.1923, 3.1923, 3.1923, 3.1973, 3.1973, 3.1973, 3.2023, 3.2023, 3.2023, 3.2073, 3.2073, 3.2073, 3.2123, 3.2123, 3.2123, 3.2172, 3.2172, 3.2172, 3.2223, 3.2223, 3.2223, 3.2273, 3.2273, 3.2273, 3.2322, 3.2322, 3.2322, 3.2373, 3.2373, 3.2373, 3.2422, 3.2422, 3.2422, 3.2472, 3.2472, 3.2472, 3.2523, 3.2523, 3.2523, 3.2573, 3.2573, 3.2573, 3.2623, 3.2623, 3.2623, 3.2672, 3.2672, 3.2672, 3.2723, 3.2723, 3.2723, 3.2772, 3.2772, 3.2772, 3.2822, 3.2822, 3.2822, 3.2873, 3.2873, 3.2873, 3.2923, 3.2923, 3.2923, 3.2972, 3.2972, 3.2972, 3.3022, 3.3022, 3.3022, 3.3073, 3.3073, 3.3073, 3.3123, 3.3123, 3.3123, 3.3173, 3.3173, 3.3173, 3.3223, 3.3223, 3.3223, 3.3273, 3.3273, 3.3273, 3.3323, 3.3323, 3.3323, 3.3373, 3.3373, 3.3373, 3.3422, 3.3422, 3.3422, 3.3473, 3.3473, 3.3473, 3.3523, 3.3523, 3.3523, 3.3572, 3.3572, 3.3572, 3.3623, 3.3623, 3.3623, 3.3672, 3.3672, 3.3672, 3.3722, 3.3722, 3.3722, 3.3773, 3.3773, 3.3773, 3.3823, 3.3823, 3.3823, 3.3873, 3.3873, 3.3873, 3.3922, 3.3922, 3.3922, 3.3973, 3.3973, 3.3973, 3.4022, 3.4022, 3.4022, 3.4072, 3.4072, 3.4072, 3.4123, 3.4123, 3.4123, 3.4173, 3.4173, 3.4173, 3.4222, 3.4222, 3.4222, 3.4272, 3.4272, 3.4272, 3.4323, 3.4323, 3.4323, 3.4373, 3.4373, 3.4373, 3.4423, 3.4423, 3.4423, 3.4473, 3.4473, 3.4473, 3.4523, 3.4523, 3.4523, 3.4573, 3.4573, 3.4573, 3.4623, 3.4623, 3.4623, 3.4672, 3.4672, 3.4672, 3.4723, 3.4723, 3.4723, 3.4773, 3.4773, 3.4773, 3.4822, 3.4822, 3.4822, 3.4873, 3.4873, 3.4873, 3.4922, 3.4922, 3.4922, 3.4972, 3.4972, 3.4972, 3.5023, 3.5023, 3.5023)
tmp_value_3sp   <- c(3.143137, 3.617083, 3.858195, 3.638978, 4.176580, 3.591255, 3.631721, 3.759594, 3.829648, 4.439001, 4.302029, 4.815218, 4.101434, 4.490471, 4.674028, 4.337504, 4.528585, 5.096626, 4.622602, 4.935889, 6.437968, 4.759153, 4.937528, 6.615284, 4.959988, 5.714340, 7.427197, 6.480052, 7.890125, 12.599474, 19.117279, 20.599498, 37.666872, 16.705940, 17.280992, 21.336132, 24.391474, 28.632084, 49.887554, 13.190841, 15.155593, 21.004715, 9.283238, 9.396185, 14.774289, 9.472725, 9.553102, 16.631408, 16.926460, 17.792448, 40.275027, 39.191614, 44.508087, 126.775415, 54.016111, 50.475803, 181.593811, 9.949723, 10.090392, 20.591943, 7.504189, 7.578138, 11.478693, 6.105209, 6.424018, 12.208959, 5.093643, 5.494090, 7.800998, 4.467365, 4.536837, 7.613863, 4.322793, 4.059286, 5.642836, 4.340654, 4.401979, 4.769335, 4.540265, 4.750818, 4.831981, 4.308818, 4.349152, 4.761115, 5.452550, 5.830265, 5.923100, 4.829553, 5.415615, 5.318505, 7.021136, 9.185826, 7.324767, 9.747197, 9.833456, 11.398996, 13.303498, 14.849633, 13.156184, 7.603488, 7.522209, 8.588793, 5.910631, 7.523940, 7.049087, 6.586118, 6.833197, 7.129613, 6.410340, 7.719080, 7.634144, 7.505249, 16.254195, 10.804335, 8.340295, 33.536348, 33.786198, 19.890808, 14.172993, 12.122307, 27.067632, 14.799074, 13.042860, 15.341137, 13.190031, 12.320386, 7.505454, 7.343623, 10.447649, 7.843097, 9.960287, 8.723921, 6.652846, 5.714769, 6.516132, 8.221704, 9.084204, 9.356681, 7.685895, 7.170302, 6.874032, 8.324411, 7.939506, 9.228651, 11.073926, 10.906249, 12.616758, 14.301549, 12.668192, 19.089261, 7.682010, 7.672578, 8.046496, 6.111310, 6.408766, 6.109975, 5.619478, 5.681297, 6.394415, 6.166218, 6.611796, 6.898253, 10.043525, 10.900972, 12.384911, 12.357223, 13.310154, 17.210121, 5.840904, 6.630784, 6.408197, 6.170959, 7.214439, 6.197204, 6.892212, 8.624143, 6.685927, 7.754015, 7.610625, 7.470321, 7.752584, 7.721453, 8.432087, 11.375427, 10.472642, 11.105655, 30.852705, 19.217157, 50.319548, 39.224741, 48.095163, 57.452570, 254.221059, 222.003546, 105.560554, 501.099581, 457.984446, 159.227812, 43.033281, 38.877022, 56.489388, 28.999366, 32.230542, 66.111809, 14.940757, 12.810433, 29.485701, 16.578169, 16.369811, 17.678994, 12.526042, 11.927305, 18.237886, 20.981736, 26.950621, 34.517333, 14.887402, 12.388188, 21.997145, 16.155418, 18.204421, 26.043935, 8.955069, 8.225061, 13.704151, 8.425991, 8.369256, 11.004345, 5.669419, 5.091482, 6.027574, 4.425507, 4.501640, 4.722402, 4.912554, 4.370630, 4.009455, 4.404402, 4.093507, 4.108540, 4.122558, 4.222786, 6.174694, 4.883419, 4.897374, 6.089955, 5.207759, 5.291827, 6.572302, 3.577925, 4.161561, 4.478663, 4.641222, 4.917573, 4.289463, 3.630037, 3.912200, 4.936952, 3.525412, 3.832756, 4.560796, 3.787831, 3.832756, 5.484775, 6.408140, 4.947284, 5.671475, 5.584854, 6.754025, 5.901189, 4.848333, 4.607161, 5.909040, 5.448812, 5.516778, 6.490055, 6.951157, 6.349622, 8.549511, 6.578000, 7.190050, 12.493685, 9.995448, 12.429004, 30.948558, 17.760435, 22.558142, 69.370385, 11.148855, 13.418169, 38.450495, 27.153120, 36.534192, 125.137204, 9.626314, 10.708156, 25.958106, 16.926216, 21.766913, 65.589278, 10.268261, 10.783897, 22.175092, 8.433032, 10.544919, 10.954346, 8.395922, 10.676055, 11.295524, 9.285765, 9.153827, 11.700831, 6.734699, 7.767812, 9.116038, 6.410754, 6.818120, 7.758391, 6.700949, 7.075254, 8.051725, 8.613287, 8.349631, 9.129552, 6.316829, 6.865606, 8.382957, 7.181412, 6.779490, 7.602228, 9.173622, 10.638541, 9.087164)
tmp_specID_3sp      <- rep(c('spec1', 'spec2', 'spec3'), 111)
expected_data_3spec <- data.frame(variable=tmp_var_3sp, value=tmp_value_3sp, specID=tmp_specID_3sp, stringsAsFactors=FALSE)
# 1 spectra plot
expected_data_1spec           <- expected_data_3spec[ rep(c(TRUE,FALSE,FALSE),111), ]
rownames(expected_data_1spec) <- NULL
# stocsy plot
tmp_stocsy_median <- c(3.627921, 3.867527, 3.791673, 4.345872, 4.694498, 5.116182, 6.309383, 6.657564, 7.422103, 9.496717, 21.001589, 16.926426, 31.218270, 15.654787, 13.331801, 15.818543, 17.805972, 71.978973, 74.972538, 11.887802, 8.610712, 6.730748, 5.571118, 4.936498, 4.365577, 4.515410, 4.685740, 4.704834, 5.665258, 5.539778, 8.138752, 9.825721, 14.091044, 8.522142, 7.285081, 7.352878, 7.847783, 9.209227, 9.589648, 12.225749, 13.155135, 10.446129, 8.469420, 9.627191, 6.469829, 8.486997, 7.196962, 9.149236, 11.203087, 14.410793, 7.680046, 6.385869, 5.776314, 6.745361, 11.556554, 14.113800, 7.057032, 7.487793, 8.504171, 7.984394, 8.844195, 11.859165, 31.836485, 58.926025, 202.990153, 306.559963, 47.109882, 36.229251, 14.733764, 17.013712, 13.696739, 25.507523, 14.604099, 18.197893, 9.256111, 8.709300, 5.367398, 4.683875, 4.788229, 4.671429, 4.700406, 6.018776, 6.970750, 5.258566, 5.746202, 4.117941, 4.448554, 4.590727, 5.298874, 5.849046, 5.003978, 5.775749, 7.551827, 10.004775, 20.954765, 47.932269, 26.074536, 84.481633, 18.432404, 43.710288, 14.227296, 10.653419, 10.364119, 10.219452, 7.772666, 7.203827, 7.626983, 9.526003, 7.347155, 7.681680, 9.849404)
tmp_stocsy_corr <- c(-0.09390684, -0.02376356, -0.15547798, -0.27564444, -0.20537992, -0.44501003, -0.31349035, -0.45538079, -0.52513883, -0.37675002, -0.01307144, -0.16981200, -0.04856155, -0.12504799, -0.29139729, -0.15532939, -0.18061214, -0.15114947, -0.14710569, -0.22710133, -0.06136329, -0.11136256, -0.03370667, -0.21449508, -0.28866210, -0.15431997, -0.06673571, -0.36404804, -0.22953245, -0.39179279, -0.07141937, -0.33312743, -0.31024473, -0.28529744, 0.04069762, 0.04345880, -0.00342369, 0.07225270, 0.15022470, -0.18892904, -0.27526480, 0.08707360, -0.14090076, -0.39642260, -0.01220554, 0.14996278, 0.18647195, 0.47217863, 0.12801657, 0.23567278, 0.58795347, 0.57297388, 0.57290846, 0.49333018, 0.34960288, 0.33237325, 0.14994014, -0.08075236, 0.02755448, 0.22728596, 0.03069702, -0.31049252, -0.33986380, 0.54501577, 0.92115569, 1.00000000, 0.53723289, 0.11820274, 0.46513770, 0.37163291, 0.31204567, 0.09763470, 0.09043868, 0.12274769, -0.02267906, 0.11330109, 0.31021296, -0.05861234, 0.18824866, -0.20932943, -0.33927691, -0.27841258, -0.27841069, -0.21756290, 0.35982848, 0.25695479, -0.02141043, -0.04250713, 0.70068365, 0.77367427, 0.37561845, 0.18963495, -0.03750500, -0.09168051, -0.39412088, -0.19653576, -0.41721369, -0.18018969, -0.35834853, -0.19061812, -0.08128296, -0.14211320, 0.04215034, 0.16668318, 0.10696203, 0.12616426, -0.01532605, 0.09893848, -0.06766775, 0.18868857, 0.15451504)
expected_data_stocsy            <- data.frame(spectra=tmp_stocsy_median, corr=tmp_stocsy_corr, ppm=expected_data_1spec$variable)
rownames(expected_data_stocsy)  <- expected_data_stocsy$ppm

test_that('default, plot 3 spectra, no spectraColour', {
  # will use automatical colour scale (rainbow)
  
	# input
  inPPM   <- inputPPM
  inData  <- inputData[1:3,]
  
  # expected
  expectedData          <- expected_data_3spec
  expectedColour        <- c("#FF0000FF", "#00FF00FF", "#0000FFFF")
  names(expectedColour) <- c('spec1', 'spec2', 'spec3')
  
  # generate plot / data table
  plot_3spec_noCol <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE))
  res_3spec_noCol  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=TRUE))
  plot_3spec_noCol_noV <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=FALSE, debug=FALSE))
  res_3spec_noCol_noV  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=FALSE, debug=TRUE))
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(plot_3spec_noCol$result))
  expect_equal(plot_3spec_noCol$result$labels$x, "ppm")
  expect_equal(plot_3spec_noCol$result$labels$y, "Intensity")
  expect_equal(length(plot_3spec_noCol$result), 9)
  
  # Check dataTable
  expect_equal(res_3spec_noCol$result$data, expectedData, tolerance=1e-6)
  expect_equal(res_3spec_noCol$result$colour, expectedColour)
  
  # Check verbose and not verbose agree (need to remove the plot_env entries that store the verbose input arg)
  plot_V    <- ggplot2::ggplot_build(plot_3spec_noCol$result)
  plot_V$layout$facet_params$plot_env <- NULL
  plot_V$plot$plot_env                <- NULL
  plot_noV  <- ggplot2::ggplot_build(plot_3spec_noCol_noV$result)
  plot_noV$layout$facet_params$plot_env <- NULL
  plot_noV$plot$plot_env                <- NULL
  expect_equal(plot_V, plot_noV)
  expect_equal(res_3spec_noCol$result, res_3spec_noCol_noV$result)
  
  # Check message
  expect_equal(plot_3spec_noCol$messages, 'Plotting 3 spectra\n')
  expect_equal(res_3spec_noCol$messages, '- Debugging mode "spectraColour", only the data table to be plotted is returned -\n')
  expect_equal(plot_3spec_noCol_noV$messages, character(0))
  expect_equal(res_3spec_noCol_noV$messages, character(0))
})

test_that('default, plot 1 spectra, no spectraColour', {
  # will use automatical colourscale (grey20)
  
  # input
  inPPM   <- inputPPM
  inData  <- inputData[1,]
  
  # expected
  expectedData          <- expected_data_1spec
  expectedColour        <- c('grey20')
  names(expectedColour) <- c('spec1')
  
  # generate plot / data table
  plot_1spec_noCol <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE))
  res_1spec_noCol  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=TRUE))
  plot_1spec_noCol_noV <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=FALSE, debug=FALSE))
  res_1spec_noCol_noV  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=FALSE, debug=TRUE))
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(plot_1spec_noCol$result))
  expect_equal(plot_1spec_noCol$result$labels$x, "ppm")
  expect_equal(plot_1spec_noCol$result$labels$y, "Intensity")
  expect_equal(length(plot_1spec_noCol$result), 9)
  
  # Check dataTable
  expect_equal(res_1spec_noCol$result$data, expectedData, tolerance=1e-6)
  expect_equal(res_1spec_noCol$result$colour, expectedColour)
  
  # Check verbose and not verbose agree (need to remove the plot_env entries that store the verbose input arg)
  plot_V    <- ggplot2::ggplot_build(plot_1spec_noCol$result)
  plot_V$layout$facet_params$plot_env <- NULL
  plot_V$plot$plot_env                <- NULL
  plot_noV  <- ggplot2::ggplot_build(plot_1spec_noCol_noV$result)
  plot_noV$layout$facet_params$plot_env <- NULL
  plot_noV$plot$plot_env                <- NULL
  expect_equal(plot_V, plot_noV)
  expect_equal(res_1spec_noCol$result, res_1spec_noCol_noV$result)
  
  # Check message
  expect_equal(plot_1spec_noCol$messages, 'Plotting 1 spectra\n')
  expect_equal(res_1spec_noCol$messages, '- Debugging mode "spectraColour", only the data table to be plotted is returned -\n')
  expect_equal(plot_1spec_noCol_noV$messages, character(0))
  expect_equal(res_1spec_noCol_noV$messages, character(0))
})

test_that('plot 3 spectra, with spectraColour', {
  # input
  inPPM   <- inputPPM
  inData  <- inputData[1:3,]
  inSpectraColour <- c('blue', 'red', 'green')
  
  # expected
  expectedData          <- expected_data_3spec
  expectedColour        <- c('blue', 'red', 'green')
  names(expectedColour) <- c('spec1', 'spec2', 'spec3')
  
  # generate plot / data table
  plot_3spec_Col <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE))
  res_3spec_Col  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=TRUE, debug=TRUE))
  plot_3spec_Col_noV <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=FALSE, debug=FALSE))
  res_3spec_Col_noV  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=FALSE, debug=TRUE))
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(plot_3spec_Col$result))
  expect_equal(plot_3spec_Col$result$labels$x, "ppm")
  expect_equal(plot_3spec_Col$result$labels$y, "Intensity")
  expect_equal(length(plot_3spec_Col$result), 9)
  
  # Check dataTable
  expect_equal(res_3spec_Col$result$data, expectedData, tolerance=1e-6)
  expect_equal(res_3spec_Col$result$colour, expectedColour)
  
  # Check verbose and not verbose agree (need to remove the plot_env entries that store the verbose input arg)
  plot_V    <- ggplot2::ggplot_build(plot_3spec_Col$result)
  plot_V$layout$facet_params$plot_env <- NULL
  plot_V$plot$plot_env                <- NULL
  plot_noV  <- ggplot2::ggplot_build(plot_3spec_Col_noV$result)
  plot_noV$layout$facet_params$plot_env <- NULL
  plot_noV$plot$plot_env                <- NULL
  expect_equal(plot_V, plot_noV)
  expect_equal(res_3spec_Col$result, res_3spec_Col_noV$result)
  
  # Check message
  expect_equal(plot_3spec_Col$messages, 'Plotting 3 spectra\n')
  expect_equal(res_3spec_Col$messages, '- Debugging mode "spectraColour", only the data table to be plotted is returned -\n')
  expect_equal(plot_3spec_Col_noV$messages, character(0))
  expect_equal(res_3spec_Col_noV$messages, character(0))
})

test_that('Warning spectraColour length', {
  # too many colours passed for the number of samples, default colours used instead
  
  # input
  inPPM   <- inputPPM
  inData  <- inputData[1:3,]
  inSpectraColour <- c('blue', 'red', 'green', 'yellow')
  
  # expected
  expectedData          <- expected_data_3spec
  expectedColour        <- c('#FF0000FF', '#00FF00FF', '#0000FFFF')
  names(expectedColour) <- c('spec1', 'spec2', 'spec3')
  
  # generate plot / data table
  plot_3spec_WarnCol <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE))
  res_3spec_WarnCol  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=TRUE, debug=TRUE))
  plot_3spec_WarnCol_noV <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=FALSE, debug=FALSE))
  res_3spec_WarnCol_noV  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=inSpectraColour, pval=NULL, driver=NULL, verbose=FALSE, debug=TRUE))
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(plot_3spec_WarnCol$result))
  expect_equal(plot_3spec_WarnCol$result$labels$x, "ppm")
  expect_equal(plot_3spec_WarnCol$result$labels$y, "Intensity")
  expect_equal(length(plot_3spec_WarnCol$result), 9)
  
  # Check dataTable
  expect_equal(res_3spec_WarnCol$result$data, expectedData, tolerance=1e-6)
  expect_equal(res_3spec_WarnCol$result$colour, expectedColour)
  
  # Check verbose and not verbose agree (need to remove the plot_env entries that store the verbose input arg)
  plot_V    <- ggplot2::ggplot_build(plot_3spec_WarnCol$result)
  plot_V$layout$facet_params$plot_env <- NULL
  plot_V$plot$plot_env                <- NULL
  plot_noV  <- ggplot2::ggplot_build(plot_3spec_WarnCol_noV$result)
  plot_noV$layout$facet_params$plot_env <- NULL
  plot_noV$plot$plot_env                <- NULL
  expect_equal(plot_V, plot_noV)
  expect_equal(res_3spec_WarnCol$result, res_3spec_WarnCol_noV$result)
  
  # Check message
  expect_equal(plot_3spec_WarnCol$messages, c('Warning: "spectraColour" length must match the number of spectra: default colour used\n', 'Plotting 3 spectra\n'))
  expect_equal(res_3spec_WarnCol$messages, c('Warning: "spectraColour" length must match the number of spectra: default colour used\n', '- Debugging mode "spectraColour", only the data table to be plotted is returned -\n'))
  expect_equal(plot_3spec_WarnCol_noV$messages, character(0))
  expect_equal(res_3spec_WarnCol_noV$messages, character(0))
})

test_that('plot 3 spectra, with pval', {
  # input
  inPPM   <- inputPPM
  inData  <- inputData[1:3,]
  inPval  <- rep(c(0.0000001, 0.001, 0.01, 0.05, 0.1, 0.25, 0.5, 1), 14)[1:111]
  
  # expected
  expectedData        <- expected_data_3spec
  expectedData$pvalue <- c(1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01, 1.0e+00, 1.0e+00, 1.0e+00, 1.0e-07, 1.0e-07, 1.0e-07, 1.0e-03, 1.0e-03, 1.0e-03, 1.0e-02, 1.0e-02, 1.0e-02, 5.0e-02, 5.0e-02, 5.0e-02, 1.0e-01, 1.0e-01, 1.0e-01, 2.5e-01, 2.5e-01, 2.5e-01, 5.0e-01, 5.0e-01, 5.0e-01)
  
  # generate plot / data table
  plot_3spec_pval <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=inPval, driver=NULL, verbose=TRUE, debug=FALSE))
  res_3spec_pval  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=inPval, driver=NULL, verbose=TRUE, debug=TRUE))
  plot_3spec_pval_noV <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=inPval, driver=NULL, verbose=FALSE, debug=FALSE))
  res_3spec_pval_noV  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=inPval, driver=NULL, verbose=FALSE, debug=TRUE))
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(plot_3spec_pval$result))
  expect_equal(plot_3spec_pval$result$labels$x, "ppm")
  expect_equal(plot_3spec_pval$result$labels$y, "Intensity")
  expect_equal(length(plot_3spec_pval$result), 9)
  
  # Check dataTable
  expect_equal(res_3spec_pval$result, expectedData, tolerance=1e-6)

  # Check verbose and not verbose agree (need to remove the plot_env entries that store the verbose input arg)
  plot_V    <- ggplot2::ggplot_build(plot_3spec_pval$result)
  plot_V$layout$facet_params$plot_env <- NULL
  plot_V$plot$plot_env                <- NULL
  plot_noV  <- ggplot2::ggplot_build(plot_3spec_pval_noV$result)
  plot_noV$layout$facet_params$plot_env <- NULL
  plot_noV$plot$plot_env                <- NULL
  expect_equal(plot_V, plot_noV)
  expect_equal(res_3spec_pval$result, res_3spec_pval_noV$result)
  
  # Check message
  expect_equal(plot_3spec_pval$messages, 'Plotting 3 spectra coloured by p-value\n')
  expect_equal(res_3spec_pval$messages, '- Debugging mode "pval", only the data table to be plotted is returned -\n')
  expect_equal(plot_3spec_pval_noV$messages, character(0))
  expect_equal(res_3spec_pval_noV$messages, character(0))
})

test_that('plot 3 spectra, with stocsy', {
  # input
  inPPM     <- inputPPM
  inData    <- inputData
  inDriver  <- 3.2765
  
  # expected
  expectedData        <- expected_data_stocsy
  
  # generate plot / data table
  plot_stocsy <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=inDriver, verbose=TRUE, debug=FALSE))
  res_stocsy  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=inDriver, verbose=TRUE, debug=TRUE))
  plot_stocsy_noV <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=inDriver, verbose=FALSE, debug=FALSE))
  res_stocsy_noV  <- evaluate_promise(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=inDriver, verbose=FALSE, debug=TRUE))
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(plot_stocsy$result))
  expect_equal(plot_stocsy$result$labels$x, "ppm")
  expect_equal(plot_stocsy$result$labels$y, "Intensity")
  expect_equal(length(plot_stocsy$result), 9)
  
  # Check dataTable
  expect_equal(res_stocsy$result, expectedData, tolerance=1e-6)
  
  # Check verbose and not verbose agree (need to remove the plot_env entries that store the verbose input arg)
  plot_V    <- ggplot2::ggplot_build(plot_stocsy$result)
  plot_V$layout$facet_params$plot_env <- NULL
  plot_V$plot$plot_env                <- NULL
  plot_noV  <- ggplot2::ggplot_build(plot_stocsy_noV$result)
  plot_noV$layout$facet_params$plot_env <- NULL
  plot_noV$plot$plot_env                <- NULL
  expect_equal(plot_V, plot_noV)
  expect_equal(res_stocsy$result, res_stocsy_noV$result)
  
  # Check message
  expect_equal(plot_stocsy$messages, 'Plotting the STOCSY on median spectra with 3.2765ppm as a driver\n')
  expect_equal(res_stocsy$messages, '- Debugging mode "STOCSY", only the data table to be plotted is returned -\n')
  expect_equal(plot_stocsy_noV$messages, character(0))
  expect_equal(res_stocsy_noV$messages, character(0))
})

test_that('raise errors', {
  inPPM     <- inputPPM
  inData    <- inputData
  
  # ppm is not integer or double
  msg1    <- c('Error: "ppm" must be a vector of integer or double')
  expect_error(NMR_plot_spectra_pval_stocsy(ppm='notAnInt', data=inData, spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE), msg1, fixed=TRUE)
  
  # data is not data.frame
  msg2    <- c('Error: "data" must be a data.frame')
  expect_error(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data='notAdatframe', spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE), msg2, fixed=TRUE)
  
  # ppm and ncol(data) length differ
  msg3    <- c('Error: "ppm" length and "data" number of columns are different')
  expect_error(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData[,1:5], spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE), msg3, fixed=TRUE)
  
  # ppm and pval length differ
  msg4    <- c('Error: "ppm" and "pval" length are different')
  expect_error(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=c(1,2,3,4,5), driver=NULL, verbose=TRUE, debug=FALSE), msg4, fixed=TRUE)
  
  # driver length is not 1
  msg5    <- c('Error: "driver" must be a single integer or double')
  expect_error(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver=c(1,2,3,4,5), verbose=TRUE, debug=FALSE), msg5, fixed=TRUE)
  
  # driver is not integer or double
  msg6    <- c('Error: "driver" must be a single integer or double')
  expect_error(NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, spectraColour=NULL, pval=NULL, driver='notAdouble', verbose=TRUE, debug=FALSE), msg6, fixed=TRUE)
})
