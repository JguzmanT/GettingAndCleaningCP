# GettingAndCleaningCP
The process does the following

1. Reads Data Files
2. Reads Label Files
3. Joins Test and Train Data Sets
4. Selects only Mean and StdDev Variables from Observation Data File(called X)
5. Replaces mean() and std() references for Mean and StdDev in the variables
6. Creates one Master Data Set (called Full_DS.txt) that joins Observation with Subjects and Activity Labels
7. Creates one Tidy Data Set (called AVG_Activity_Subject_DS.txt) that summarizes data
8. Write two files (Full_DS.txt and AVG_Activity_Subject_DS.txt) to the main folder
