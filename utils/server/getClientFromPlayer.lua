getClientFromPlayer = function(player)
    if (type(player) ~= "userdata") or (not player.syncer) then
        return false;
    end

    local syncerID = player.syncer;
    
    local allClients = getClients();
    for _, client in ipairs(allClients) do
        if (client.player == player) then 
            return client;
        end
    end

    return false;
end