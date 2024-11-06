#' Title: Summarize the variables in the provided data 
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @import palmerpenguins 
#' @description: This function is to summarize the numeric variable in a dataset when given one or more grouping condition. It will generate a summary tibble to show the calculated median, mean and standard deviation of the numeric variable under the indicated grouping conditions. There is an option for user to ignore missing value with na.rm arguement.
#' @details This function is utilizing `group_by`and `summarize()`functions in `dplyr` package
#' @param data a data set in the data frame format or tibble format 
#' @param ...  ellipse, indicating one or multiple grouping variables in `data`, has to be a categorical variable existed in the dataset to group the population  
#' @param summ_vars a summarizing variable must be numeric variable and existed in the dataset 
#'@param na.rm logical variable to indicate if missing value should be removed or not. default is FALSE(not remove) 
#' @return A summary tibble with calculated  mean, median and standard deviation of the indicated variables. 
#' @export
#' @examples
#' data("penguins",package="palmerpenguins")
#' summarize_data(penguins,species,island,summ_vars=bill_length_mm,na.rm=TRUE)
#' summarize_data(penguins,sex,island,summ_vars=bill_depth_mm,na.rm=TRUE)


summarize_data<- function(data,...,summ_vars,na.rm=FALSE){
  
  if (!is.numeric(data[[deparse(substitute(summ_vars))]])) {
    stop("Input summ_var is not in the data set or is not a numeric variable, double check")
  }
  #extra variable is used in grouping if needed
  data |>
    dplyr::group_by(...) |> 
    dplyr::summarize(median=median({{summ_vars}},na.rm=na.rm),mean=mean({{summ_vars}},na.rm=na.rm),sd=sd({{summ_vars}},na.rm=na.rm)) 
}

