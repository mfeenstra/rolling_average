# rolling_average

To calculate the rolling average given a series of discrete data (time series)

---------

# Example usage:

```rb

matt@appdev:0:~/rolling_average$ irb

>> load './mathias.rb'
   ==>true

>> Mathias::rolling_average([ 1.1, 1.7, 2.3, 2.37, 2.97, 3.6, 4, 4.1, 4.3, -4.7, -100 ], 2)
   ==>[nil, nil, 2.088, 2.588, 3.048, 3.408, 3.7939999999999996, 2.2600000000000002, -18.46, nil, nil]
>>


```
