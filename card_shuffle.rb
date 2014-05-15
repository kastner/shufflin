suits = %w| ⚫️ ⚪️ 🔴 🔵|.reverse
suits = %w|♦️ ️♣ ️♥️ ♠️|.reverse

nums = ["A"] + (2..9).to_a + %w|* J Q K|

cards = suits.map {|s| nums.collect {|i| "%s %s " % [i, s]}.reverse}.flatten
# cards = (1..52).map {|i| "%02d  " % i}
puts cards.length
puts cards.join("|")

initial = cards.dup
done = false
cycle_count = 0


until done do
  cycle_count += 1
  mid = (cards.length / 2.0).ceil

  puts "---"
  puts "#{cycle_count} - middle: #{cards[mid]}"
  puts "---"

  left, right = cards.each_slice(mid).to_a

  if cycle_count > 2
    # in shuffle
    cards = left.zip(right).flatten
  else
    # out shuffle
    cards = right.zip(left).flatten
  end

  # cards = cards[0..mid-1].zip(cards[mid..cards.length-1]).flatten
  # puts cards.inspect

  puts cards.join("|")

  done = cards == initial
end
