def stock_picker(stock_prices) 
  best_days = [0, 0]
  greatest_profit = 0
  last_day = stock_prices.length - 1

  stock_prices.each_with_index do |buy_price, buy_day|
    last_day = stock_prices.length - 1

    # relative to buy_day
    possible_sell_days = stock_prices[buy_day.next..last_day] 

    possible_sell_days.each_with_index do |sell_price, sell_day|
      profit = sell_price - buy_price
      if profit > greatest_profit
        greatest_profit = profit
        best_days[0] = buy_day
        # shift hack to get actual index ("day") in stock_prices
        best_days[1] = buy_day.next + sell_day 
      end
    end
  end
  
  best_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# p stock_picker([1,5,3,8,6,2,7,4])
# p stock_picker([3,5,3,1,9,6,12,2,7,1])