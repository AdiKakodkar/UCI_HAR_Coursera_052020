## Human Activity Recognition Using Smartphones Dataset: Tidy Data Exercise
#### Version 1.0

###### Aditya Kakodkar: kakodkar.aditya[at]gmail.com

Data from the Human Activity Recognition Using Smartphones Dataset was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The dataset contained two parts i.e. the test and the train dataset. The test dataset contained 30% and the training set contained 70% subjects who participated in the experiment. 

During this exercise to tidy up and summerize the data both the test and train datasets were combined. Main focus of the exercise was on the measurement means and standard deviations. Hence, only these variables were selected to create a smaller dataset. Activities performed by subjects for each measurement were added to the smaller dataset. Further an even smaller tidy dataset was created with averages of variables for each subject and each activity. Detailed information about the exercise can be obtained from the attached codebook.

### For each record it is provided:

- Subject identifier whith activity which was performed for that measurement.
- 66 variables containing averages of the measurements for the given activity for the given subject

### The project includes the following files:

- 'README.txt'

- 'CodeBook': Provides detailed explaination about the experiment and use/modification of variables and experiment design.

- 'run_analysis.R': Provides step by step analysis carried out to obtain the final resultant tidy dataset.


### License:

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Aditya Kakodkar 2020
