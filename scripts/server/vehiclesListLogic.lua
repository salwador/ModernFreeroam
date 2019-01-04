----------------
-- Prepare vehicles list
----------------

local vehiclesListInfo = {};

local allowedVehiclesList = {};
local disabledVehiclesList = {};

----------------

for _, vehicleInfo in ipairs(vehiclesList) do
    if (not vehicleInfo.disable) then
        table.insert(allowedVehiclesList, vehicleInfo);
    else 
        table.insert(disabledVehiclesList, vehicleInfo);
    end

    vehiclesListInfo[vehicleInfo.id] = vehicleInfo;
end

local totalAllowedVehiclesInList = #allowedVehiclesList;
local totalDisabledVehiclesInLost = #disabledVehiclesList;
local totalVehiclesInList = totalAllowedVehiclesInList + totalDisabledVehiclesInLost;

print(string.format("[Starting] Loaded x%s vehicles. x%s vehicle are disabled.", totalVehiclesInList, totalDisabledVehiclesInLost));

----------------
-- Vehicle list methods
----------------

isVehicleModelAllowed = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end

    if (not vehiclesListInfo[id]) then
        return false;
    end

    return (not vehiclesListInfo[id].disable);
end

isVehicleModelDisabled = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end

    if (not vehiclesListInfo[id]) then
        return true;
    end

    return (vehiclesListInfo[id].disable or false);
end

getVehicleModelInfo = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end
    
    return (vehiclesListInfo[id] or false);
end

isVehicleModelValid = function(id)
    if (not id) or (type(id) ~= "number") then
        return false;
    end
    
    return (vehiclesListInfo[id] and true or false);
end