#' filter data by minmum magnitude, maximun magnitude and depths
#'
#' @param dt data.table
#' @param mag_min integer
#' @param mag_max integer
#' @param depths character vector
#' @return data.table

filterData <- function(dt, mag_min, mag_max, depths) {
    round_2 <- function(x) round(x, 2)
    
    datetimes <- data.table(datetime=sort(dt$datetime))
    
    ordered <- dt %>% filter(magnitude >= mag_min, magnitude <= mag_max, depthLevel %in% depths) 
    
    left_join(ordered, datetimes,  by = "datetime") %>%
        mutate_each(funs(round_2), magnitude, depth)
}
