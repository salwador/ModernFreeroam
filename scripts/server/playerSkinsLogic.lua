----------------
-- Prepare player skins
----------------

local playerSkinsInfo = {};

local allowedPlayerSkins = {};
local disabledPlayerSkins = {};

----------------

for _, skinInfo in ipairs(playerSkins) do
    if (not skinInfo.disable) then
        table.insert(allowedPlayerSkins, skinInfo);
    else 
        table.insert(disabledPlayerSkins, skinInfo);
    end

    playerSkinsInfo[skinInfo.id] = skinInfo;
end

local totalAllowedPlayerSkins = #allowedPlayerSkins;
local totalDisabledPlayerSkins = #disabledPlayerSkins;
local totalPlayerSkins = totalAllowedPlayerSkins + totalDisabledPlayerSkins;

print(string.format("[Starting] Loaded x%s player skins. x%s skins are disabled.", totalPlayerSkins, totalDisabledPlayerSkins));

----------------
-- Player skins methods
----------------

isPlayerSkinAllowed = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end

    if (playerSkinsInfo[id]) then
        return false;
    end

    return (not playerSkinsInfo[id].disable);
end

isPlayerSkinDisabled = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end

    if (playerSkinsInfo[id]) then
        return false;
    end

    return (playerSkinsInfo[id].disable or false);
end

getPlayerSkinInfo = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end
    
    return (playerSkinsInfo[id] or false);
end

isPlayerSkinValid = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end
    
    return (playerSkinsInfo[id] and true or false);
end

getRandomAllowedPlayerSkin = function()
    local skinIndex = math.random(1, totalAllowedPlayerSkins);

    return allowedPlayerSkins[skinIndex].id;
end

getRandomDisabledPlayerSkin = function()
    local skinIndex = math.random(1, totalDisabledPlayerSkins);

    return disabledPlayerSkins[skinIndex].id;
end

