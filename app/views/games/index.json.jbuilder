json.array!(@games) do |game|
  json.extract! game, :date, :number
  json.url game_url(game, format: :json)
end
