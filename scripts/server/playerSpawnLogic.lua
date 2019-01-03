----------------
-- Prepare spawn positions
----------------

for index, spawnPositionInfo in ipairs(playerSpawnPositions) do
    playerSpawnPositions[index] = Vec3(spawnPositionInfo.x, spawnPositionInfo.y, spawnPositionInfo.z);
end

local totalPlayerSpawnPositions = #playerSpawnPositions;

print(string.format("[Starting] Loaded x%s player spawn positions.", totalPlayerSpawnPositions));

----------------
-- Spawn useful methods
----------------

local getRandomPlayerSpawnPosition = function()
    local spawnPositionIndex = math.random(1, totalPlayerSpawnPositions);

    return playerSpawnPositions[spawnPositionIndex];
end

----------------
-- Spawn main logic
----------------

local spawnPlayerOnJoin = function(_, client)
    local spawnPositionVector = getRandomPlayerSpawnPosition();
    local spawnSkin = getRandomAllowedPlayerSkin();

    spawnPlayer(client, spawnPositionVector, 0.0, spawnSkin);
end

local spawnPlayerOnWasted = function(_, player, attacker, weapon, bodypart)
    local playerSkin = player.modelIndex;    
    local playerName = player.name;    

    local client = getClientFromPlayer(player);
    local spawnPositionVector = getRandomPlayerSpawnPosition();

    spawnPlayer(client, spawnPositionVector, 0.0, playerSkin);

    if (attacker) then
        if (player ~= attacker) then 
            local attackerName = attacker.name;

            message(string.format("* %s killed by %s", playerName, attackerName));
        else
            message(string.format("* %s committed suicide", playerName));
        end
    else 
        message(string.format("* %s died", playerName));
    end
end

addEventHandler("onPlayerJoined", spawnPlayerOnJoin);
addEventHandler("onPedWasted", spawnPlayerOnWasted);

----------------
-- Some player commands
----------------

local killPlayerByCommand = function(_, parameters, client)
    local player = client.player;
    local playerSkin = player.modelIndex;

    local spawnPositionVector = getRandomPlayerSpawnPosition();

    spawnPlayer(client, spawnPositionVector, 0.0, playerSkin);
end

addCommandHandler("spawn", killPlayerByCommand);
addCommandHandler("respawn", killPlayerByCommand);