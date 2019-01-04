local mGuiElements = {};
local mGuiVisibleElements = {};
local latestElementID = 0;

----------------
-- Rendering
----------------

local mGuiDrawElements = function()
    for elementID, _ in pairs(mGuiVisibleElements) do 
        local elementInfo = mGuiElements[elementID];
        
        if (elementInfo.visible) then
            local elementPosition = elementInfo.position;
            local elementSize = elementInfo.size;
            local x, y = elementPosition.x, elementPosition.y;
            local width, height = elementSize.x, elementSize.y;

            -- TODO
        end
    end
end

addEventHandler("onDrawHUD", mGuiDrawElements);

----------------
-- Methods for create GUI elements
----------------

mGUIcreateWindow = function(title, position, size)
    latestElementID = latestElementID + 1;

    mGuiElements[latestElementID] = {
        type = "window",
        visible = false,
        ID = latestElementID,

        title = title,
        position = position,
        size = size,

        childs = {}
    };

    mGuiVisibleElements[latestElementID] = true;

    return mGuiElements[latestElementID];
end