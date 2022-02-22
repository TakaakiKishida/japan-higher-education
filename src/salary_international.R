library(magrittr)
salary_list <-
  tibble::tibble(
    country = c("Japan",
                "China",
                "Hong Kong",
                "Korea",
                "US",
                "UK",
                "Germany",
                "Sweden",
                "Switzerland",
                "Denmark",
                "Netherlands"#,
                # "France",
                # "Belgium",
                # "Norway",
                # "Finland",
                # "Canada"
                ),
    associate_professor = c(53148, # Japan
                            NA,
                            NA,
                            NA,
                            79654, # US
                            93406, # UK
                            89659, # Germany
                            61043, # Sweden
                            165822, # Switzerland
                            80365, # Denmark
                            92146 # the Netherlands
                            ),
    full_professor = c(65570, # Japan
                       NA,
                       NA,
                       NA,
                       102402, # US
                       131919, # UK
                       75492, # Germany
                       83403, # Sweden
                       189072, # Switzerland
                       105362, # Denmark
                       114022 # the Netherlands
                       )
    ) 

# more reference: e-Stat
# https://www.e-stat.go.jp/dbview?sid=0003017832
# https://www.e-stat.go.jp/dbview?sid=0003086667
# https://www.e-stat.go.jp/dbview?sid=0003109412