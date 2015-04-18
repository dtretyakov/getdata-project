# Human Activity Recognition Using Smartphones Data Set 

## Original Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING, STANDING`, `LAYING`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A full description of original data is available at the site where the data was obtained at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Transformation

While analysis execution source data transformed into single data set with a descriptive column names and stored in `data` variable.
After that against `data` executed processing to create tidy data set with the average of each variable for each activity and each subject.
Result data set stored in the file `tidy_data.txt`.

## Variables

`activity` - defines volunteer activity state.

`subject` - identifies the subject who performed the activity for each window sample.

Measurement variables use following naming convention:
```
{domain}{Target}{Sensor}{Type}{Function}{Direction}
```

*domain* - defines signals in time (`time`) / frequency (`freq`) domains.

*Target* - defines measurement target: `Body` / `Gravity`.

*Sensor* - defines sensor: accelerometer (`Acc`) / gyroscope (`Gyro`).

*Type* - defines sensor measurement type: jerk (`Jerk`) / magnitude (`Mag`).

*Function* - defines applied function: mean (`Mean`), standard deviation (`Std`).

*Direction* - defines direction for 3-axial signals.
