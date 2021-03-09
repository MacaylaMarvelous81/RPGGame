local targetPlayer = nil

function Tick(deltaTime)
    if targetPlayer == nil then
        targetPlayer = Game.FindNearestPlayer(script:GetWorldPosition())
        if targetPlayer ~= nil then
            script.parent:Follow(targetPlayer,200)
            script.parent:LookAtContinuous(targetPlayer, true)
        end
    end
end
