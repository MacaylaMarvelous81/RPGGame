Game.playerJoinedEvent:Connect(function(plr)
	plr.diedEvent:Connect(function(plr2, dmg)
		Events.BroadcastToPlayer(plr, "ShowDeadUI")
		Task.Wait(5)
		plr:Respawn({
			position = script.parent.parent:FindChildByName("Spawn Point"):GetWorldPosition(),
			rotation = Rotation.New(0, 0, 0)
		})
	end)
end)