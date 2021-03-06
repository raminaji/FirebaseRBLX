local DataStoreService = game:GetService("DataStoreService")
local playerData = DataStoreService:GetDataStore("PlayerData")

local function onPlayerJoin(player)  
	local Time = Instance.new("IntValue") 
	Time.Name = "Time"
	Time.Parent = player
	
	local playerUserId = "Player_" .. player.UserId  
	local data = playerData:GetAsync(playerUserId)  
	if data then
		Time.Value = data
	else
	Time.Value = 0
	end
end







local function onPlayerExit(player)  

	local success, err = pcall(function()
		local playerUserId = "Player_" .. player.UserId
		playerData:SetAsync(playerUserId, player.Time.Value) 
	end)


	if not success then
		warn('Could not save data!')	
	end
end



game.Players.PlayerAdded:Connect(onPlayerJoin)
game.Players.PlayerRemoving:Connect(onPlayerExit)
