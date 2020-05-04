

estimationDataFileName <- file.path(base.path, "UseData/data_1week_sample05_ne_20200427.csv")
estimationData <- read_csv(estimationDataFileName)
# There were some NAs in the first two rows of the data
estimationData <- estimationData[-1:-2, ]


rates <- estimationDataSubset %>%
  dplyr::select(DATE, X_TB, X_ST) %>%
  distinct()

consumption <- estimationDataSubset %>%
  dplyr::select(DATE, Y) %>%
  group_by(DATE) %>%
  summarise(Y = mean(Y)) %>%
  ungroup()


allData <- consumption %>%
  left_join(rates, by="DATE")
allData[,2:4] <- scale(allData[,2:4])

allData <- allData %>% 
  gather(Key, Amount, Y, X_TB, X_ST) %>%
  mutate(Key = as.factor(as.character(Key))) %>%
  filter(Key %in% c("Y", "X_TB"))

ggplot(allData) +
  geom_line(aes(x=DATE, y=Amount, color=Key)) +
  ggtitle("Weekly")



estimationDataFileName <- file.path(base.path, "UseData/data_1month_sample05_ne_20200427.csv")
estimationData <- read_csv(estimationDataFileName)
# There were some NAs in the first two rows of the data
#estimationData <- estimationData[-1:-2, ]


rates <- estimationDataSubset %>%
  dplyr::select(DATE, X_TB, X_ST) %>%
  distinct()

consumption <- estimationDataSubset %>%
  dplyr::select(DATE, Y) %>%
  group_by(DATE) %>%
  summarise(Y = mean(Y)) %>%
  ungroup()

allData <- consumption %>%
  left_join(rates, by="DATE")
allData[,2:4] <- scale(allData[,2:4])

allData <- allData %>% 
  gather(Key, Amount, Y, X_TB, X_ST) %>%
  mutate(Key = as.factor(as.character(Key))) %>%
  filter(Key %in% c("Y", "X_TB"))

ggplot(allData) +
  geom_line(aes(x=DATE, y=Amount, color=Key)) +
  ggtitle("Monthly")

