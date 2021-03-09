local propDamage = script:GetCustomProperty("Damage")
script.parent.beginOverlapEvent:Connect(function(trigger, obj)
	if obj and obj:IsA("Player") then
		local damage = Damage.New(propDamage)
		damage.reason = DamageReason.NPC
		obj:ApplyDamage(damage)
	end
end)