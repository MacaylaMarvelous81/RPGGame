local propDamage = script:GetCustomProperty("Damage")
local isInvincible = {}
--[[
script.parent.beginOverlapEvent:Connect(function(trigger, obj)
	if obj and obj:IsA("Player") and not isInvincible[obj] then
		isInvincible[obj] = true
		Task.Spawn(function()
			Task.Wait(1)
			isInvincible[obj] = false
		end)
		local damage = Damage.New(propDamage)
		damage.reason = DamageReason.NPC
		obj:ApplyDamage(damage)
	end
end)
--]]
function Tick(deltaTime)
	for _, currentPlayer in pairs(Game.GetPlayers({
		ignoreDead = true
	})) do
		if script.parent:IsOverlapping(currentPlayer) and not isInvincible[currentPlayer.id] then
			isInvincible[currentPlayer.id] = true
			Task.Spawn(function()
				Task.Wait(1)
				isInvincible[currentPlayer.id] = false
			end)
			currentPlayer:SetResource("DetailedDeathReason", 0)
			local damage = Damage.New(propDamage)
			damage.reason = DamageReason.NPC
			currentPlayer:ApplyDamage(damage)
		end
	end
end