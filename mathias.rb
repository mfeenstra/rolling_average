# app/lib/mathias.rb
# an excerpt from my original module (minus calculus for finding first and
#   second derivatives).
#
# matt.a.feenstra@gmail.com
# Licensed under GPLv3, all rights reserved.

module Mathias

  # rolls through the series with a window, produces an
  #   array of average values from the window
  # Requires: A series of numbers as an Array
  # Returns:  Array of the same size padded with nil at the ends
  def self.rolling_average(series, radius)
    window = ( radius * 2 ) + 1
    unless series.is_a?(Array) && (window <= series.size) then return false end
    start_idx = radius
    stop_idx = series.size - 1 - radius
    results = Array.new(series.size)
    var = 0
    while( (start_idx + var) <=  stop_idx)
      results[start_idx + var] =
        Mathias::sum_neighbors(start_idx + var, series, radius) / window.to_f
      var += 1
    end
    results
  end

  # index is the location, series is the data, and
  #   radius for summation window (diameter) from left to right
  # Requires: from index, for series, with radius
  # Returns: Float -- cumulative sum for radius + 1, a window into the series
  def self.sum_neighbors(index, series, radius)
    start = index - radius
    ending = index + radius
    sum = 0.0
    var = 0
    if ( (start >= 0) && ((index + radius) < series.size) ) then
      while( (start + var) <= (index + radius) )
        unless series[start + var].nil? then
          sum += series[start + var].to_f
        else
          puts "[sum_neighbors] cannot sum a nil value!: " \
               "current index at: #{index} for radius: #{radius} " \
               "series.size: #{series.size}"
          return false
        end
        var += 1
      end
    else
      puts "[sum_neighbors] out of bounds error (decrease radius): " \
           "requested index was: #{index} radius: #{radius} " \
           "series.size: #{series.size}"
      return false
    end
    sum
  end

end # module
