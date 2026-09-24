def stock_picker(prices_per_day) 
  best_days = [0, 0]
  greatest_profit = 0
  last_day = prices_per_day.length - 1

  prices_per_day.each_with_index do |buy_price, buy_day|
    last_day = prices_per_day.length - 1

    # relative to buy_day
    possible_sell_days = prices_per_day[buy_day.next..last_day] 

    possible_sell_days.each_with_index do |sell_price, sell_day|
      profit = sell_price - buy_price
      if profit > greatest_profit
        greatest_profit = profit
        best_days[0] = buy_day
        # shift hack to get actual index ("day") in `prices_per_day`
        best_days[1] = buy_day.next + sell_day 
      end
    end
  end
  
  best_days
end

# ARRAYS FOR TESTING
some_days = [17,3,6,9,15,8,6,1,10]
# some_other_days = [1,5,3,8,6,2,7,4]
# some_other_other_days = [3,5,3,1,9,6,12,2,7,1]

result = stock_picker(some_days)
puts "Best day to buy: Day #{result[0]}\nBest day to sell: Day #{result[1]}"