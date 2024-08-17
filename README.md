<h1>CDD (Extreme Rainfall Project)</h1>

<h2>Description</h2>
In this project, I calculated the CDD (Consecutive Dry Days). The calculation of CDD is an important index in assessing extreme precipitation events. Conducting this analysis is crucial as it significantly impacts water resources and agriculture in a given region. Prolonged dry conditions can lead to reduced crop yields and increased water shortages.
<br />


<h2>Languages and Utilities Used</h2>

- <b>RStudio</b> 
- <b>Excel</b>

<h2>Environments Used </h2>

- <b>Windows 10</b>

<h2>Program walk-through:</h2>

<p align="left">
I shortlisted Kupang, Semarang, and Pontianak as the focus areas. This project examines the impact of extreme rainfall over the long term across various climate types, specifically tropical rainforest, tropical monsoon, and tropical savanna climates. The analysis covers the past 30 years, with Pontianak, Semarang, and Kupang serving as representative locations for each respective climate type.
<br/>
  
<h3>Data Management and Calculation</h3>
<p align="left">
The first step was to collect the data, which required daily rainfall data for 30 years. Since my data was in Excel format, I used the readxl package to read it. The example below uses only Kupang data. As shown in the data preview, there are two variables (date and precipitation), and there are 10,958 observations.
<br/>
  
<p align="center">
<img src="https://drive.google.com/uc?id=1ieLAIlnu2JV4PJitwNN2SLJMypn84G39"/>
<br />
  
<p align="left">
Next, I determined which days were considered dry days (I set the threshold at rainfall <1 mm for this project). I then calculated the number of CDDs (maximum consecutive dry days with no wet days in succession). Subsequently, I exported the data to a CSV file for further analysis. I applied the same process to the data from Pontianak and Semarang.
<br/>

<p align="center">
<img src="https://drive.google.com/uc?id=11CJcyTLv4PqsHa7ZepyzJ-aKBvAnoZUq"/>
<br />

<h3>Data Visualization</h3>
<p align="left">
I used ggplot to visualize the data. Prior to this, I created an Excel file containing the combined CDD data for each area, as seen in the console interface. I also created trend lines for the graphs to facilitate easier analysis of the output.
<br/>

<p align="center">
<img src="https://drive.google.com/uc?id=1tP5tKxg5jjRZy0mzG8VMFgzy-fMTqjju"/>
<br />

<p align="left">
In addition to the graphs, I analyzed the trends in detail to enhance the analysis in my report.
<br/>

<p align="center">
<img src="https://drive.google.com/uc?id=1Xz6N3BE78GvuiDYAqkPaAsbxy_528N8D"/>
<br />

<p align="left">
Here is a screenshot of the graph with a simple analysis included as part of the report.
<br/>

<p align="center">
<img src="https://drive.google.com/uc?id=1X78kOG45cx88ckfO8dcLZxisl_XHfeLy"/>
<br />
