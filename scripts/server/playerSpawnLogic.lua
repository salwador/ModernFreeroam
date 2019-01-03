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

local spawnPlayerOnJoin = function(_, client)
    local spawnPositionVector = getRandomPlayerSpawnPosition();
    local spawnSkin = getRandomAllowedPlayerSkin();

    spawnPlayer(client, spawnPositionVector, 0.0, spawnSkin);
end

addEventHandler("onPlayerJoined", spawnPlayerOnJoin);