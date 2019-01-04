----------------
-- Tables for save some player's info about spawn vehicles
----------------

local playerVehicle = {};
local lastPlayerVehicleSpawnTime = {};

----------------
-- Spawn vehicles logic
----------------

local spawnPlayerVehicle = function(command, parameters, client)
    parameters = string.split(parameters);

    if (#parameters == 0) then
        messageClient(string.format("* Invalid parameters for command \"/%s\"", command), client, COLOUR_RED);
        messageClient(string.format("* Use /%s [Vehicle ID]", command), client, COLOUR_RED);
        return false;
    end

    local vehicleID = tonumber(parameters[1]);

    if (not vehicleID) then
        messageClient(string.format("* Invalid parameters for command \"/%s\"", command), client, COLOUR_RED);
        messageClient("* Vehicle ID should be a number", client, COLOUR_RED); 
        return false;
    end

    local player = client.player;
    local position = player.position;
    local heading = player.heading;
    local x, y, z = position.x, position.y, position.z;

    if (not isVehicleModelValid(vehicleID)) then
        messageClient(string.format("* Invalid parameters for command \"/%s\"", command), client, COLOUR_RED);
        messageClient(string.format("* \"%s\" is not a Vehicle ID", vehicleID), client, COLOUR_RED); 
        return false;
    end

    if (not isVehicleModelAllowed(vehicleID)) then
        messageClient(string.format("* Sorry, but vehicle \"%s\" is not allowed on server", vehicleID), client, COLOUR_RED);
        return false;
    end
    
    local playerLastVehicle = playerVehicle[client] or false;

    if (playerLastVehicle) then
        destroyElement(playerLastVehicle);   
        playerVehicle[client] = nil;
    end

    playerVehicle[client] = createVehicle(vehicleID, position);

    print(parameters);
end

addCommandHandler("cv", spawnPlayerVehicle);
addCommandHandler("createvehicle", spawnPlayerVehicle);
addCommandHandler("spawnveh", spawnPlayerVehicle);
addCommandHandler("veh", spawnPlayerVehicle);

----------------
-- Remove vehicle when player leave server, and remove temporary info from tables
----------------

local removePlayerVehicleOnQuit = function(_, client)
    local playerVehicle = playerVehicle[client] or false;

    if (playerVehicle) then
        destroyElement(playerVehicle);   
        playerVehicle[client] = nil;
    end

    ----------------

    if (lastPlayerVehicleSpawnTime[client]) then
        lastPlayerVehicleSpawnTime[client] = nil;
    end
end

addEventHandler("onPlayerQuit", removePlayerVehicleOnQuit);