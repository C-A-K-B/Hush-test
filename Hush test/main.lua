local MyCharacterMod = RegisterMod("Hush Character Mod", 1)

local hushType = Isaac.GetPlayerTypeByName("Hush", false)

    function MyCharacterMod:playerinit(player)
        if player:GetPlayerType() == hushType then

            player:AddSmeltedTrinket(TrinketType.TRINKET_BLUE_KEY, true)
        end
    end

    function MyCharacterMod:playerstats(player, cacheFlag)
        if player:GetPlayerType() == hushType then
            if cacheFlag == CacheFlag.CACHE_DAMAGE then
                player.Damage = player.Damage * 1.10
            end
            if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
                player.ShotSpeed = player.ShotSpeed  * 1.10
            end
            if cacheFlag == CacheFlag.CACHE_FIREDELAY then
                player.MaxFireDelay = player.MaxFireDelay / 1.10
            end
            if cacheFlag == CacheFlag.CACHE_RANGE then
                player.TearRange = player.TearRange * 1.10
            end
            if cacheFlag == CacheFlag.CACHE_SPEED then
                player.MoveSpeed = player.MoveSpeed * 1.10
            end
            if cacheFlag == CacheFlag.CACHE_LUCK then
                player.Luck = player.Luck * 1.10
            end
        end
    end

MyCharacterMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MyCharacterMod.playerstats) 
MyCharacterMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MyCharacterMod.playerinit)