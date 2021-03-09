local DiedUIContainer = script.parent:FindChildByName("DiedUIContainer")
local HUDContainer = script.parent:FindChildByName("HUDContainer")
local LocalPlayer = Game.GetLocalPlayer()
Events.Connect("ShowDeadUI", function()
	-- TODO: Check if died locally to reduce network usage
	DiedUIContainer.visibility = Visibility.FORCE_ON
	Task.Wait(5) -- Wait locally instead of another broadcast to reduce network usage
	DiedUIContainer.visibility = Visibility.FORCE_OFF
end)
function Tick(deltaTime)
	HUDContainer:FindChildByName("HealthBar").progress = LocalPlayer.hitPoints / LocalPlayer.maxHitPoints
	HUDContainer:FindChildByName("HealthText").text = "Health: " .. LocalPlayer.hitPoints .. "/" .. LocalPlayer.maxHitPoints
end