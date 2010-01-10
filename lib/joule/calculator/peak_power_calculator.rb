module Joule
  module Calculator
    module PeakPowerCalculator
      
      def calculate_peak_power_values(options = {})
        array = @data_points.collect{|v| v.power}
        options[:durations].each { |duration|
          @peak_powers << calculate_peak_power_value(array, duration, options[:total_duration])
        }
      end

      def calculate_peak_power_value(array, duration, total_duration)
        if duration > total_duration
          PeakPower.new(duration)
        else
          Joule::PowerCalculator::peak_power(array, duration, (duration/@properties.record_interval))
        end
        
      end
      
    end
  end
end