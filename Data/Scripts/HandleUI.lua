local DiedUIContainer = script.parent:FindChildByName("DiedUIContainer")
local HUDContainer = script.parent:FindChildByName("HUDContainer")
local LocalPlayer = Game.GetLocalPlayer()
Events.Connect("ShowDeadUI", function()
	-- TODO: Check if died locally to reduce network usage
	local deathreason = LocalPlayer:GetResource("DetailedDeathReason")
	local drtext = DiedUIContainer:FindChildByName("DeathReason")
	if deathreason == 0 then
		drtext.text = "Killed by an enemy."
	elseif deathreason == 1 then
		drtext.text = "Went out of bounds."
	else
		drtext.text = ""
	end
	DiedUIContainer.visibility = Visibility.FORCE_ON
	Task.Wait(5) -- Wait locally instead of another broadcast to reduce network usage
	DiedUIContainer.visibility = Visibility.FORCE_OFF
end)
function Tick(deltaTime)
	HUDContainer:FindChildByName("HealthBar").progress = LocalPlayer.hitPoints / LocalPlayer.maxHitPoints
	HUDContainer:FindChildByName("HealthText").text = "Health: " .. LocalPlayer.hitPoints .. "/" .. LocalPlayer.maxHitPoints
end