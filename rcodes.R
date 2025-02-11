
#######################works
# Create a binary indicator column
df_binary$present <- 1

# Reshape the data to wide format
df_wide <- reshape(df_binary, idvar = "tissue", timevar = "model.rxns", direction = "wide")

# Replace missing values with 0
df_wide[is.na(df_wide)] <- 0

# Drop the first column (tissue)
df_wide <- df_wide[, -1]

# Create the UpSet plot
upset(df_wide)
##################################
# Load required libraries
library(readxl)
library(UpSetR)

# Read the Excel file
file_path <- "C:/Users/hp/OneDrive/Desktop/IIT_M/exp/exp 1.xlsx"
df <- read_excel(file_path)

# Ensure the dataframe has both 'tissue' and 'model.rxns' columns
if (!("tissue" %in% colnames(df)) || !("model.rxns" %in% colnames(df))) {
  stop("The dataframe is missing 'tissue' or 'model.rxns' columns.")
}

# Create binary indicators for model.rxns
df_binary <- table(df$tissue, df$model.rxns)

# Convert counts to binary (1 for present, 0 for absent)
df_binary <- as.data.frame(ifelse(df_binary > 0, 1, 0))

# Set row names to 'tissue'
row.names(df_binary) <- row.names(df_binary)

# Ensure dataframe has at least two dimensions
if (ncol(df_binary) < 2) {
  df_binary <- cbind(df_binary, dummy_col = 0)
}

# Create the UpSet plot
upset_obj <- upset(df_binary)

# Display the plot
print(upset_obj)
########################
# Load required libraries
library(readxl)
library(UpSetR)

# Read the Excel file
file_path <- "C:/Users/hp/OneDrive/Desktop/IIT_M/exp/exp 1.xlsx"
df <- read_excel(file_path)

# Ensure the dataframe has both 'tissue' and 'model.rxns' columns
if (!("tissue" %in% colnames(df)) || !("model.rxns" %in% colnames(df))) {
  stop("The dataframe is missing 'tissue' or 'model.rxns' columns.")
}

# Create binary indicators for model.rxns
df_binary <- table(df$model.rxns, df$tissue)

# Convert counts to binary (1 for present, 0 for absent)
df_binary <- as.data.frame(ifelse(df_binary > 0, 1, 0))

# Set row names to 'model.rxns'
row.names(df_binary) <- row.names(df_binary)

# Ensure dataframe has at least two dimensions
if (ncol(df_binary) < 2) {
  df_binary <- cbind(df_binary, dummy_col = 0)
}

# Create the UpSet plot
upset_obj <- upset(df_binary)

# Display the plot
print(upset_obj)
########################################################
# Load required libraries
library(readxl)
library(UpSetR)

# Read the Excel file
file_path <- "C:/Users/hp/OneDrive/Desktop/IIT_M/exp/exp 1.xlsx"
df <- read_excel(file_path)

# Ensure the dataframe has both 'tissue' and 'model.rxns' columns
if (!("tissue" %in% colnames(df)) || !("model.rxns" %in% colnames(df))) {
  stop("The dataframe is missing 'tissue' or 'model.rxns' columns.")
}

# Create binary indicators for model.rxns
df_binary <- table(df$model.rxns, df$tissue)

# Convert counts to binary (1 for present, 0 for absent)
df_binary <- as.data.frame(ifelse(df_binary > 0, 1, 0))

# Set row names to 'model.rxns'
row.names(df_binary) <- row.names(df_binary)

# Ensure dataframe has at least two dimensions
if (ncol(df_binary) < 2) {
  df_binary <- cbind(df_binary, dummy_col = 0)
}

# Create the UpSet plot with custom colors
upset_obj <- upset(df_binary, 
                   main.bar.color = "#FF5733",  # Main bar color
                   sets.bar.color = "#7FFF00",  # Sets bar color
                   matrix.color = "#0D0C0C",    # Matrix color
                   shade.color = "#FFD700")     # Intersection shade color

# Display the plot
print(upset_obj)

######################################
