# higher-education-japan

### Data source
**Japan**

- e-Stat (The Portal Site of Official Statistics of Japan), promoted by the Statistics Bureau
  - (Japanese page)[https://www.e-stat.go.jp/] 
  - (English page)[https://www.e-stat.go.jp/en]

**Professor Salary**

- [School Teachers Survey](https://www.e-stat.go.jp/dbview?sid=0003109412) by MEXT for Japan
- [Lecturer and Professor Salaries – Explained](https://www.discoverphds.com/advice/after/lecturer-and-professor-salaries) by DiscoverPhDs for the UK
- [Aiming for a Swiss professorship](https://www.academics.com/guide/professorship-switzerland) and [Salaries of professors in Switzerland](https://www.myscience.ch/working/salary/salary_professor) for Switzerland
- [Professor Salaries From Around the World](https://academicpositions.com/career-advice/professor-salaries-from-around-the-world) for Europe and America (took a weighted average)
- [PPP Converter](https://www.chrislross.com/PPPConverter/) developed by Chris Ross (I understand this does not achieve rigorous comparison)


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
