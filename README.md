# higher-education-japan

### Data source
- e-Stat (The Portal Site of Official Statistics of Japan), promoted by the Statistics Bureau
  - (Japanese page)[https://www.e-stat.go.jp/] 
  - (English page)[https://www.e-stat.go.jp/en]


### Objective 
- (Re)Confirm and present the sad fact about current higher education in Japan
  - In particular, I will look at university (undergraduate) and postgraduate matters
- Take this opportunity to better handle Japanese public data that has a reputation for its untidy data format / database using [e-Stat API](https://www.e-stat.go.jp/api/)


### Code and Folder
- Regarding API stuff, I referred Professor Yusaku Horiuchi's GitHub (see Reference)
- To avoid showing the personal appId, I set it in my `.Renviron`
- Obtaining education related data simultaneously, use `src/download.R`


### Reference
- ["estatapi - 政府統計の総合窓口（e-Stat）のAPIを使うためのRパッケージ"](https://yutannihilation.github.io/estatapi/) by Hiroaki Yutani
- ["Downloading municipality-level data from eStats"](https://github.com/yhoriuchi/eStats) by Professor Yusaku Horiuchi (Dartmouth College)
