# Install and load the required library if not already installed
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
library(readxl)

# Read the Excel file (replace 'your_excel_file.xlsx' with your file path)
df <- read_excel("D:/Hidroklimatologi/Project/Kupang.xlsx")

# Define a threshold for what is considered a dry day (change this to your own threshold)
threshold <- 1  # For example, 1 mm

# Create a binary variable indicating dry days (0 for wet, 1 for dry)
df$DryDay <- ifelse(df$Precipitation <= threshold, 1, 0)

# Extract the year from the Date column
df$Year <- as.integer(format(df$Date, "%Y"))

# Calculate consecutive dry days for each year
library(dplyr)
df <- df %>%
  group_by(Year) %>%
  mutate(ConsecutiveDryDays = with(rle(DryDay), rep(lengths * values, lengths))) %>%
  ungroup()

# Calculate the maximum consecutive dry days per year
max_consecutive_dry_days <- df %>%
  group_by(Year) %>%
  summarise(MaxConsecutiveDryDays = max(ConsecutiveDryDays))

# Print or save the results
print(max_consecutive_dry_days)

# To export the results to a CSV file, uncomment and customize the following line:
write.csv(max_consecutive_dry_days, "CDD Kupang.csv")


##PLOTTING
df_all <- read_excel("D:/Hidroklimatologi/Project/CDD_All.xlsx")
library("ggplot2")

# Create a line graph with trendlines
ggplot(data = df_all, aes(x = Year)) +
    geom_line(aes(y = Kupang, color = "Kupang"), size = 0.8) +
    geom_line(aes(y = Pontianak, color = "Pontianak"), size = 0.8) +
    geom_line(aes(y = Semarang, color = "Semarang"), size = 0.8) +
    stat_smooth(aes(y = Kupang, color = "Kupang"), method = "lm", se = FALSE, linetype = "dashed") +
    stat_smooth(aes(y = Pontianak, color = "Pontianak"), method = "lm", se = FALSE, linetype = "dashed") +
    stat_smooth(aes(y = Semarang, color = "Semarang"), method = "lm", se = FALSE, linetype = "dashed") +
    labs(x = "Tahun", y = "Jumlah CDD (hari)") +
    ggtitle("CDD di Kupang, Pontianak, Semarang Tahun 1991-2020") +
    scale_color_manual(values = c("Kupang" = "blue", "Pontianak" = "red", "Semarang" = "green"), 
                       labels = c("Kupang", "Pontianak", "Semarang")) +
    scale_x_continuous(breaks = seq(1991, 2020, 2)) +
    theme_minimal() +
    theme(legend.position = "right") +
    labs(color = "Legenda")  # Judul keterangan warna


##baca tren
# Install dan muat library
install.packages("forecast")
library(forecast)

# Menghitung tren menggunakan regresi linier
  tren <- lm(df_all$Pontianak ~ df_all$Year, df_all=df_all)

# Melihat ringkasan tren
summary(tren)

