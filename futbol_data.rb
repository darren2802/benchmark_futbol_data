require_relative '../../1module/projects/futbol/lib/result.rb'
require 'csv'
require 'benchmark'

data_path = '../../1module/projects/futbol/data/game_teams.csv'

result_data = []

CSV.foreach(data_path, headers: true, header_converters: :symbol) do |csv_row|
  result_data << Result.new(csv_row)
end

puts ''

# Benchmark.bm do |benchmark|
#   benchmark.report('hash_upfron_1_level') do
#     results_wins_1_1 = Hash.new(0)
#     result_data.each do |result|
#       results_wins_1_1[result.team_id] += 1 if result.result == 'WIN'
#     end
#   end
#
#   benchmark.report('hash_reduce_1_level') do
#     results_wins_1_2 = result_data.reduce(Hash.new(0)) do |acc, result|
#       acc[result.team_id] += 1 if result.result == 'WIN'
#       acc
#     end
#   end
#
# end
#
# puts ''

# Benchmark.bm do |benchmark|
#   benchmark.report('hash_upfron_2_levels') do
#     results_wins_2_1 = Hash.new{ |hash, key| hash[key] = Hash.new(0) }
#     result_data.each do |result|
#       teamid = result.team_id
#       hoa = result.hoa
#       result = result.result
#       results_wins_2_1[teamid][hoa] += 1 if result == 'WIN'
#     end
#   end
#
#   benchmark.report('hash_reduce_2_levels') do
#     results_wins_2_2 = result_data.reduce( Hash.new{ |hash, key| hash[key] = Hash.new(0) } ) do |acc, result|
#       teamid = result.team_id
#       hoa = result.hoa
#       result = result.result
#       acc[teamid][hoa] += 1 if result == 'WIN'
#       acc
#     end
#   end
# end

results_wins_2_2 = result_data.reduce( Hash.new{ |hash, key| hash[key] = Hash.new(0) } ) do |acc, result|
  teamid = result.team_id
  hoa = result.hoa
  result = result.result
  acc[teamid][hoa] += 1 if result == 'WIN'
  acc
end

require "pry"; binding.pry
