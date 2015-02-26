#' Classical metric multidimensional scaling
#'
#' Classical metric multidimensional scaling which is the same as the cmdscale in the stats package. Which follows the analyis of Mardia (1978): Mardia, K.V. (1978) Some properties of classical multidimensional scaling. Communications on Statistics – Theory and Methods, A7, 1233–41.
#' 
#' @param D dissimilarities/distances of class dist.
#' @param groupnr groupnr when known, each object can be given a number to which group it belongs
#' @param colv vector containing color names for each group number
#' @param main title of the plot, by default there is no title. 
#' @param ... arguments which can be parsed to either the \code{\link[mva]{hclust}} and \code{\link[stats]{cmdscale}} procedures.
#' @param PLOT whether to plot or not to plot, by default TRUE.
#' @param VERBOSE whether to give a messages on the criterion for each iteration, by default set to equal TRUE.
#' @param PLOT whether to plot or not to plot, by default TRUE.
#' 
#' @return 
#' similar output as \code{\link[stats]{cmdscale}}
#' @export                                                                               
                                                                              
cmds <- function (D, groupnr = NULL, main = NULL, colv = palette(), ..., PLOT = TRUE) {
    fit = cmdscale(D, eig = TRUE)
    x = fit$points[, 1]
    y = fit$points[, 2]
    if (PLOT) {
        if (is.null(groupnr)){
            cols = 1
	    } else {
            cols = colv[groupnr + 1]
        }
        lims = c(floor(100 * min(c(x), min(y)))/100, ceiling(100 * 
            max(c(max(x), max(y))))/100)
        plot(x, y, xlab = "Dimension 1", ylab = "Dimension 2", 
            main = main, col = cols, xlim = lims, ylim = lims, 
            xaxs = "i", yaxs = "i", pch = 20)
    }
    invisible(fit)
}


      