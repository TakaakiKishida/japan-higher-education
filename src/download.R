# Title 
# Takaaki Kishida


# Initial settings --------------------------------------------------------

pacman::p_load(tidyverse, estatapi)



# Add appID ---------------------------------------------------------------
# You need to get an "application ID" by following guide (https://www.e-stat.go.jp/api/api-info/api-guide)

# appId <- "XXXXXXXX" # Enter manually in Console or Set at your .Renviron



# Make a list of data sets to use -----------------------------------------

stats_IDs <- estat_getStatsList(appId = appId, 
                                searchWord = "社会・人口統計体系") %>% 
  # STATISTICS_NAME: 統計表の提供統計名及び提供分類名 (https://www.e-stat.go.jp/api/api-info/e-stat-manual)
  # filter(str_detect(STATISTICS_NAME, "市区町村データ 基礎データ（オリジナル）")) %>% 
  select(`@id`) %>% 
  pull()

# e.g., > stats_IDs[1]   [1] "0000020101"



# Make a list of variables included in the data sets ----------------------

vars_IDs <- NULL

for (i in 1:length(stats_IDs)){
  vars_IDs <- bind_rows(
    vars_IDs,
    # Get meta-information about the statistical dataset via e-Stat API (https://yutannihilation.github.io/estatapi/reference/estat_getMetaInfo.html)
    # stats_IDsで指定した統計表が保有するメタデータを取得
    estat_getMetaInfo(appId = appId,
                      statsDataId = stats_IDs[i])[["cat01"]] %>% 
      mutate(ID = stats_IDs[i])
  )
}

# targeted names can be detected by running the following code, or by manually searching from View() or view()
# vars_IDs %>% 
#   filter(str_detect(`@name`, "大学院")) %>% 
#   view()

# suppose one wants to use data with ID# 0000010105
educ_vars_IDs <- vars_IDs %>% 
  filter(ID == "0000010105",
         str_detect(`@name`, "大学"))

# Due to some reasons, there are overlaps
educ_vars_IDs <- educ_vars_IDs %>% distinct()
# educ_vars_IDs %>% view()
# educ_vars_IDs %>% count(`@code`)
# educ_vars_IDs %>% distinct() %>% view()




# Make a set of specific variables to use ---------------------------------

target_vars <- 
  c("E6102_大学数", 
    "E610201_大学数（国立）", 
    "E610202_大学数（公立）", 
    "E610203_大学数（私立）", 
    "E6202_大学教員数", 
    "E620201_大学教員数（男）", 
    "E620202_大学教員数（女）", 
    "620210_大学教員数（国立）", 
    "E620220_大学教員数（公立）", 
    "E620230_大学教員数（私立）", 
    "E6302_大学学生数", 
    "E630201_大学学生数（男）", 
    "E630202_大学学生数（女）", 
    "E630210_大学学生数（国立）", 
    "E630211_大学学生数（国立）（男）", 
    "E630212_大学学生数（国立）（女）", 
    "E630220_大学学生数（公立）", 
    "E630221_大学学生数（公立）（男）", 
    "E630222_大学学生数（公立）（女）", 
    "E630230_大学学生数（私立）", 
    "E630231_大学学生数（私立）（男）", 
    "E630232_大学学生数（私立）（女）",
    "E6403_大学入学者数",
    "E640301_大学入学者数（男）",
    "E640302_大学入学者数（女）",
    "E6502_大学卒業者数",
    "E650201_大学卒業者数（男）",
    "E650202_大学卒業者数（女）",
    "E9205_在学者数（大学・大学院）",
    "E920501_在学者数（大学・大学院）（男）",
    "E920502_在学者数（大学・大学院）（女）")

selected <- educ_vars_IDs %>% 
  filter(`@name` %in% target_vars)

# selected %>% count(`@code`)
# selected %>% distinct()



# Get a set of specific variables to use ----------------------------------

# test: get data manually (#7)
# out <- estat_getStatsData(appId = appId,
#                           statsDataId = "0000010105",
#                           cdCat01     = "E620202")

get_data <- function(id, year_from = 1995){
  
  out <- estat_getStatsData(appId = appId,
                            statsDataId = selected[id, "ID"],
                            cdCat01     = selected[id, "@code"])
  
  varcode <- out[1, "cat01_code"] # Variable code
  
  out %>% 
    mutate(year = str_extract(調査年, "\\d+") %>% as.numeric()) %>% 
    select(地域,
             area_code, 
             year, 
             value) %>% 
    filter(year >= year_from) %>% 
    set_names(c("pref", "area_code", "year", varcode))
  
}

out <- get_data(1)

for (i in 2:nrow(selected)){
  temp <- get_data(i)
  out <- full_join(out, temp, by = c("pref", "area_code", "year")) 
}
# max: 2,160



# Change variable names accordingly ---------------------------------------

selected$`@name`[match(names(out), selected$`@code`)]
selected$`@code`[match(names(out)[4:ncol(out)], selected$`@code`)]
selected$`@name`[match(names(out)[4:ncol(out)], selected$`@code`)]

# names(out)
names(out)[4:ncol(out)] <- 
  selected$`@name`[match(names(out)[4:ncol(out)], selected$`@code`)] %>% 
  stringr::word(2, sep = "_")



# Save data ---------------------------------------------------------------

if (dir.exists(glue::glue("data")) == FALSE) {
  dir.create(glue::glue("data"))
}

readr::write_rds(out, "data/education.rds")
