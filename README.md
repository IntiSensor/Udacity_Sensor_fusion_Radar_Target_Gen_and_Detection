# README outlining the project rubric points

* FMCW Waveform Design
- Designed a Waveform design with the given specifications. 
- The calculated slope is 2.0455e9(approx. 2e13 as expected).

* Simulation loop
- Simulated Target movement and calculated the mixed signal for every timestamp.
- Achieved the FFT implementation with correct range as the initial position of the target.

* Range FFT
- Implemented the Range FFT on the Mixed signal and plotted the same.

* 2D CFAR
- Implemented the 2D CFAR process on the O/P of Range Doppler Map.
- Noise is suppressed and very accurate positioning of the peak (target) compared to the example
in the walkthrough is obtained. 

##### Range Result from 1D-FFT!
<img src="https://github.com/diwamanic/Udacity_Sensor_fusion_Radar_Target_Generation_and_Detection/blob/master/Media/Range_Result_from_1D_fft.jpg" width="700" height="400"/>

##### Range-Doppler-Map with noise!
<img src="https://github.com/diwamanic/Udacity_Sensor_fusion_Radar_Target_Generation_and_Detection/blob/master/Media/Range_Doppler_Map_with_noise.jpg" width="700" height="400"/>

##### Final Result: CFAR on Range-Doppler-Map!
<img src="https://github.com/diwamanic/Udacity_Sensor_fusion_Radar_Target_Generation_and_Detection/blob/master/Media/Final_Result_Image.jpg" width="700" height="400"/>

## Special Notes:
* Selection of Training, Guard cells and offset:
- Training cells on both dimensions, I have chosen it to be 16.
- Guard cells in both dimensions, I have chosen it to be 4.
- And offset value is adjusted after seeing the result and varying it accordingly to get
a small variance in the final output (fine tuned on a trial basis).

* Implementation steps of 2D CFAR process:
- Summed the whole noise level from the upper left corner of the training cells to the
lower right corner of the training cells.
- And then, subtracted the noise level from the guard cells and the cell under test(CUT).
- And then, I took the average of the above result.
- After offsetting the final result, I used it to compare it with the cell under test signal's value
to determine if it could be a target or not.
- So, I have changed the values in the RDM map to be 1, if it is greater than the corresponding 
threshold value, if not, assigned it to be 0.

* Steps taken to suppress the non-threshold cells at the edges:
- Simply assigned all the other cells to be 0, if it did not already have either 1 or 0.
