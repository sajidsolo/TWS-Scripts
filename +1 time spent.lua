local function addTime (player)
	while true do
		wait(1)
		player.leaderstats.Time.Value = player.leaderstats.Time.Value + 1
	
	end
end

game.Players.PlayerAdded:Connect(addTime)
