----------------
-- Disconnect type name from id
----------------

local disconnectTypeNames = {
    [6] = "Quit"
};

local getQuitReasonFromID = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end

    return disconnectTypeNames[id] or string.format("Undefined #%s", id);
end

----------------
-- JoinQuit main logic
----------------

local printPlayerJoin = function(_, client)
    local clientName = client.name;
    local clientIP = client.ip;
    local clientGameVersion = client.gameVersion;

    message(string.format("* %s joined to server", clientName));
    print(string.format("[JoinQuit] %s joined to server [IP: %s; Version: %s]", clientName, clientIP, clientGameVersion));
end

local printPlayerQuit = function(_, client, disconnectType)
    local clientName = client.name;
    local quitReason = getQuitReasonFromID(disconnectType);

    message(string.format("* %s leave from server [%s]", clientName, quitReason));
    print(string.format("[JoinQuit] %s leave from server [Reason: %s]", clientName, quitReason));
end

addEventHandler("onPlayerJoin", printPlayerJoin);
addEventHandler("onPlayerQuit", printPlayerQuit);