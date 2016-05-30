This CodeBook describes the data set produced by the run\_analysis.R
script in my GettingandCleaningData GitHub repo.

A number of files are input into this script but they are not altered in
any way. This codebook describes the transformations performed on the
data in those files.

The data is extracted from the data sets obtained at this website:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The following steps were taken to produce the data in the file
HCI\_HAR\_Tidy\_Avgs.txt:

1.  Add the data in /test/subject\_test.txt and /test/y\_test.txt as
    columns named SubjectId and Activity to the data in
    /test/test\_X.txt. Repeat with the training data.
2.  Merge the rows in the test and training data frames produced in step
    1 to create a new data frame containing all the data.
3.  Rename the unnamed columns in the data frame created in step 2 with
    the feature names listed in features.txt, where V1 of the data frame
    takes the name listed in V2 of the first row (V1 = 1) of
    features.txt.
4.  Extract only the columns containing mean and standard deviation data
    (along with the associated SubjectId and Activity)
5.  Tidy the variable names in the data set by removing all "." and
    capitalizing name sections (e.g. Mean). (e.g. tBodyAcc-mean()-X)
    becomes tBodyAcc.mean...X on loading into a data frame. After
    transformation it is TBodyAccMeanX)
6.  Use /activity\_labels.txt to look up the integer values in the
    Activity column and replace with meaningful activity names (e.g. 2
    becomes "WALKING\_UPSTAIRS")
7.  Create a new data frame containing the mean of each feature column
    (i.e. all columns other than SubjectId and Activity) by SubjectId
    and Activity, using colMeans.
8.  Write the resulting data frame to a txt file called
    HCI\_HAR\_Tidy\_Avgs.txt.

HCI\_HAR\_Tidy\_Avgs.txt has the following structure:

<table>
<thead>
<tr class="header">
<th align="left">VARIABLE</th>
<th align="left">ORDER</th>
<th align="left">TYPE</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">SubjectId</td>
<td align="left">1</td>
<td align="left">INT</td>
<td align="left">Identifier for the volunteer (subject) producing this row of observations</td>
</tr>
<tr class="even">
<td align="left">Activity</td>
<td align="left">2</td>
<td align="left">CHR</td>
<td align="left">Meaningingful name identifying the activity the subject was performing at the time of the observation. There are 6 values for each subject: LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, WALKING UPSTAIRS</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccMeanX</td>
<td align="left">3</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer X direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccMeanY</td>
<td align="left">4</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccMeanZ</td>
<td align="left">5</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccStdX</td>
<td align="left">6</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer X direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccStdY</td>
<td align="left">7</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccStdZ</td>
<td align="left">8</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TGravityAccMeanX</td>
<td align="left">9</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain gravity accelerometer X direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TGravityAccMeanY</td>
<td align="left">10</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain gravity accelerometer Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TGravityAccMeanZ</td>
<td align="left">11</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain gravity accelerometer Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TGravityAccStdX</td>
<td align="left">12</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain gravity accelerometer Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TGravityAccStdY</td>
<td align="left">13</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain gravity accelerometer Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TGravityAccStdZ</td>
<td align="left">14</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain gravity accelerometer Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccJerkMeanX</td>
<td align="left">15</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer X direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccJerkMeanY</td>
<td align="left">16</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer Y direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccJerkMeanZ</td>
<td align="left">17</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer Z direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccJerkStdX</td>
<td align="left">18</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer X direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccJerkStdY</td>
<td align="left">19</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer Y direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccJerkStdZ</td>
<td align="left">20</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer X direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroMeanX</td>
<td align="left">21</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope X direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroMeanY</td>
<td align="left">22</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroMeanZ</td>
<td align="left">23</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroStdX</td>
<td align="left">24</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroStdY</td>
<td align="left">25</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroStdZ</td>
<td align="left">26</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroJerkMeanX</td>
<td align="left">27</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope X direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroJerkMeanY</td>
<td align="left">28</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope Y direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroJerkMeanZ</td>
<td align="left">29</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope Z direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroJerkStdX</td>
<td align="left">30</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope X direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroJerkStdY</td>
<td align="left">31</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope Y direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroJerkStdZ</td>
<td align="left">32</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope Z direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccMagMean</td>
<td align="left">33</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer signal magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccMagStd</td>
<td align="left">34</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer signal magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TGravityAccMagMean</td>
<td align="left">35</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain gravity accelerometer signal magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TGravityAccMagStd</td>
<td align="left">36</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain gravity accelerometer signal magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyAccJerkMagMean</td>
<td align="left">37</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body accelerometer Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyAccJerkMagStd</td>
<td align="left">38</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body accelerometer Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroMagMean</td>
<td align="left">39</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope signal magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroMagStd</td>
<td align="left">40</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope signal magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">TBodyGyroJerkMagMean</td>
<td align="left">41</td>
<td align="left">NUM</td>
<td align="left">The mean of the time domain body gyroscope Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">TBodyGyroJerkMagStd</td>
<td align="left">42</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the time domain body gyroscope Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyAccMeanX</td>
<td align="left">43</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer X direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyAccMeanY</td>
<td align="left">44</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyAccMeanZ</td>
<td align="left">45</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyAccStdX</td>
<td align="left">46</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer X direction signal averaged (mean) by subject and activity</td>
</tr>
<tr class="odd">
<td align="left">FBodyAccStdY</td>
<td align="left">47</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyAccStdZ</td>
<td align="left">48</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyAccJerkMeanX</td>
<td align="left">49</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer X direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyAccJerkMeanY</td>
<td align="left">50</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer Y direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyAccJerkMeanZ</td>
<td align="left">51</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer Z direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyAccJerkStdX</td>
<td align="left">52</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer X direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyAccJerkStdY</td>
<td align="left">53</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer Y direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyAccJerkStdZ</td>
<td align="left">54</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer Z direction Jerk averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyGyroMeanX</td>
<td align="left">55</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body gyroscope X direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyGyroMeanY</td>
<td align="left">56</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body gyroscope Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyGyroMeanZ</td>
<td align="left">57</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body gyroscope Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyGyroStdX</td>
<td align="left">58</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body gyroscope X direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyGyroStdY</td>
<td align="left">59</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body gyroscope Y direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyGyroStdZ</td>
<td align="left">60</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body gyroscope Z direction signal averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyAccMagMean</td>
<td align="left">61</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyAccMagStd</td>
<td align="left">62</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyBodyAccJerkMagMean</td>
<td align="left">63</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body accelerometer Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyBodyAccJerkMagStd</td>
<td align="left">64</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body accelerometer Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyBodyGyroMagMean</td>
<td align="left">65</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body gyroscope magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyBodyGyroMagStd</td>
<td align="left">66</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body gyroscope magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="odd">
<td align="left">FBodyBodyGyroJerkMagMean</td>
<td align="left">67</td>
<td align="left">NUM</td>
<td align="left">The mean of the frequency domain body gyroscope Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
<tr class="even">
<td align="left">FBodyBodyGyroJerkMagStd</td>
<td align="left">68</td>
<td align="left">NUM</td>
<td align="left">The standard deviation of the frequency domain body gyroscope Jerk magnitude averaged (mean) by subject and activity.</td>
</tr>
</tbody>
</table>
