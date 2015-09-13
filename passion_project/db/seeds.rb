require_relative '../app/controllers/apis_controller'

stats = PlayerStatsClient.new
response = stats.get_stats
player_array = JSON.parse(response)

player_array.each do |hash|
  hash.delete('StatID')
  hash.delete('TeamID')
  hash.delete('PlayerID')
  hash.delete('SeasonType')
  hash.delete('Season')
  hash.delete('Started')
  hash.delete('Updated')
  hash.delete('EffectiveFieldGoalsPercentage')
  hash.delete('TwoPointersMade')
  hash.delete('TwoPointersAttempted')
  hash.delete('TwoPointersPercentage')
  hash.delete('ThreePointersMade')
  hash.delete('ThreePointersAttempted')
  hash.delete('OffensiveReboundsPercentage')
  hash.delete('DefensiveReboundsPercentage')
  hash.delete('TotalReboundsPercentage')
  hash.delete('TrueShootingAttempts')
  hash.delete('PlayerEfficiencyRating')
  hash.delete('AssistsPercentage')
  hash.delete('StealsPercentage')
  hash.delete('AssistsPercentage')
  hash.delete('BlocksPercentage')
  hash.delete('TurnOversPercentage')
  hash.delete('UsageRatePercentage')
  hash.delete('FieldGoalsMade')
  hash.delete('FieldGoalsAttempted')
  hash.delete('FreeThrowsMade')
  hash.delete('FreeThrowsAttempted')
  hash.delete('OffensiveRebounds')
  hash.delete('DefensiveRebounds')
  hash.delete('TrueShootingPercentage')
  hash.delete('FantasyPoints')
  hash.delete('PersonalFouls')
end
# p player_array
@pool = Pool.create(name: 'NBA 2015')
player_array.each do |player_stats|
	# Player.create(name: player_stats["Name"])
  @pool.players.create(name: player_stats["Name"], team: player_stats["Team"], position: player_stats["Position"], games: player_stats["Games"], field_goals_percentage: player_stats["FieldGoalsPercentage"], three_pointers_percentage: player_stats["ThreePointersPercentage"], free_throws_percentage: player_stats["FreeThrowsPercentage"], rebounds: player_stats["Rebounds"], assists: player_stats["Assists"], steals: player_stats["Steals"], blocked_shots: player_stats["BlockedShots"], turnovers: player_stats["Turnovers"], points: player_stats["Points"])
end

# Player.order(points: :desc).each_with_index do |player, index|
#   player.points_rank = index + 1
#   player.save
# end
# Pool.create(name: 'NBA 2015')
# @pool = Pool.first
# player_array.each do |player_stats|
#   @pool.players.create(name: player_stats[:name])
#   # @pool.players.create(name: player_stats["Name"], team: player_stats["Team"], position: player_stats["Position"], games: player_stats["Games"], field_goals_percentage: player_stats["FieldGoalsPercentage"], three_pointers_percentage: player_stats["ThreePointersPercentage"], free_throws_percentage: player_stats["FreeThrowsPercentage"], rebounds: player_stats["Rebounds"], assists: player_stats["Assists"], steals: player_stats["Steals"], blocked_shots: player_stats["BlockedShots"], turnovers: player_stats["Turnovers"], points: player_stats["Points"])
# end
