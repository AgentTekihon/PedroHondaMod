local Mod = RegisterMod("PedroHondaMod", 1)
 
local PedroHonda = { -- Cambia "PedroHonda" por el nombre de tu personaje
    DAMAGE = 4, -- Todo es relativo a las estadisticas de Isaac (Se suman/restan a las default)
    SPEED = 1.5,
    SHOTSPEED = 1.5,
    TEARHEIGHT = 2.5,
    TEARFALLINGSPEED = 0,
    LUCK = 3,
    FLYING = true,                                 
    TEARFLAG = 1<<4, -- 0 default
    TEARCOLOR = Color(0.0, 1.0, 0.0, 1.0, 0, 0, 0)  -- Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) default
}
 
function PedroHonda:onCache(player, cacheFlag)
    if player:GetName() == "PedroHonda" then
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + PedroHonda.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + PedroHonda.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - PedroHonda.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + PedroHonda.TEARFALLINGSPEED
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + PedroHonda.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + PedroHonda.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and PedroHonda.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | PedroHonda.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = PedroHonda.TEARCOLOR
        end
          if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
        player.MaxFireDelay = player.MaxFireDelay - 2;
    end
    end
end
 
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, PedroHonda.onCache)