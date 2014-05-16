suits = %w| ⚫️ ⚪️ 🔴 🔵|.reverse
suits = %w|️♥️ ️♣ ♦️ ♠️|#.reverse

nums = ["A"] + (2..9).to_a + %w|* J Q K|

cards = suits.map.with_index {|s,i| i < 2 ? nums.collect {|i| "%s %s " % [i, s]} : nums.reverse.collect {|i| "%s %s " % [i, s]}}.flatten

  # nums.collect {|i| "%s %s " % [i, s]}.reverse}.flatten
# cards = (1..52).map {|i| "%02d  " % i}
# puts cards.length
puts "--------------------\n*** IN *** shuffle\n--------------------"
puts cards.join("|")

initial = cards.dup
done = false
cycle_count = 0


until done do
  cycle_count += 1
  mid = (cards.length / 2.0).ceil

  puts "---"
  puts "#{cycle_count} - middle: #{cards[mid-1]}"
  puts "---"

  left, right = cards.each_slice(mid).to_a

  # if cycle_count > 2
    # in shuffle
    # cards = left.zip(right).flatten
    cards = right.zip(left).flatten
  # else
    # out shuffle
    # cards = right.zip(left).flatten
    # cards = left.zip(right).flatten
  # end

  # cards = cards[0..mid-1].zip(cards[mid..cards.length-1]).flatten
  # puts cards.inspect

  puts cards.join("|")

  done = cards == initial
end
