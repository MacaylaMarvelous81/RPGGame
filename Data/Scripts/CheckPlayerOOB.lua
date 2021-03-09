function Tick(deltaTime)
	for _, currentPlayer in pairs(Game.GetPlayers({
		ignoreDead = true
	})) do
		if currentPlayer:GetWorldPosition().z <= -1284 then
			print("Player " .. currentPlayer.name .. " out of bounds!")
			currentPlayer:SetResource("DetailedDeathReason", 1)
			local damage = Damage.New(currentPlayer.maxHitPoints)
			damage.reason = DamageReason.MAP
			currentPlayer:ApplyDamage(damage)
		end
	end
end