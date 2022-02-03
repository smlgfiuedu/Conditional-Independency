# Conditional-Independency
To execute the R code of CondIndependentTestNoParent.R, you need do some preparation. a.) Install package "bnlearn" in R, (because I used "bnlearn" package in my code.).  b.) Download file CondIndependentTest.R and put it in a folder.

Execute the CondIndependentTestNoParent.R code. a.)In Console of R, you type in: source("/home/Documents/Rcode/CondIndependentTest.R") The content in "" is the location where you put file CondIndependentTest.R. If there are some errors, you should double check the path is correct. b.)In Console of R, you type in something like the following: CondIndTwoVar(filename = "/home/Documents/sprinkler1001.txt", methodu="x2", exfilename = "/home/Documents/pvalueSorted(sprinkler).xlsx") filename: is the full path and file name of your data file. methoudu: is the method you'll choose to do conditional independence test. You could choose "x2" or "mi". "x2" means Chi-Square Test of Independence and "mi" means mutual information test. exfilename: is the full path and excel file name which you want to output your test result.

Same way for executing ConditionIndOneParent.R and ConditionIndTwoParent.R

Note: The the data in data file could not be integer, for example 0, 1. It should be string, like s0, s1, or good, bad or state0 or state1.
