Helper <- function(data){
  MedianAge <- median(sleep$Age, na.rm=TRUE)
  MinDuration <- min(sleep$Duration, na.rm=TRUE)
  MaxDuration <- max(sleep$Duration, na.rm=TRUE)
  MeanRSES <- mean(sleep$RSES, na.rm = TRUE)
  SDRSES <- sd(sleep$RSES, na.rm= TRUE)
  report <- data.frame(medAge= MedianAge, meanRSES= MeanRSES, SDRSES= SDRSES,
                       rangeDur= MaxDuration - MinDuration)
  names(report) <- c("MedianAge", "SelfEsteem", "SE_SD", "DurationRange")
  round(report, 2)
}