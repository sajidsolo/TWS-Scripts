local DataStoreService = game:GetService("DataStoreService") -- Gets DataStore Service.

local PointsStore = DataStoreService:GetDataStore("PointsStore")  -- Create DataStore Service.

game.Players.PlayerAdded:Connect(function(Player)  -- Add Function When Player Added To Server

	local SavedPoints = PointsStore:GetAsync(Player.UserId) -- Load Player Data.

	local Leaderstats = Instance.new("Folder", Player) -- Add Leaderstats Folder.
	Leaderstats.Name = "leaderstats"

	local PointsValue = Instance.new("IntValue", Leaderstats) -- Add IntValue
	PointsValue.Name = "Time"

	if SavedPoints ~= nil then -- Load Point Amount From Player Data.
		PointsValue.Value = SavedPoints
	end

	PointsValue.Changed:Connect(function(NewPoints) -- Save Player Points After Player Left Server.
		PointsStore:SetAsync(Player.UserId, NewPoints)
	end)
	end)