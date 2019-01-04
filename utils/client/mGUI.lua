local mGuiElements = {};
local mGuiVisibleElements = {};
local latestElementID = 0;

local titleTextFont = lucasFont.createDefaultFont(16.0, "Roboto", "Light");
local smallTextFont = lucasFont.createDefaultFont(8.0, "Roboto", "Light");

local mGuiColors = {
    window = {
        background = toColour(0, 0, 0, 235),
        title = toColour(216, 153, 75, 255),
        titleText = toColour(255, 255, 255, 255)
    }
};

local mGuiDrawElements = function()
    for elementID, _ in pairs(mGuiVisibleElements) do 
        local elementInfo = mGuiElements[elementID];
        
        if (elementInfo.visible) then            
            local backgroundColor = mGuiColors.window.background;
            local titleColor = mGuiColors.window.title;
            local titleTextColor = mGuiColors.window.titleText;

            local elementPosition = elementInfo.position;
            local elementSize = elementInfo.size;
            local x, y = elementPosition.x, elementPosition.y;
            local width, height = elementSize.x, elementSize.y;

            local titleString = elementInfo.title;

            drawing.drawRectangle(nil, elementPosition, elementSize, backgroundColor, backgroundColor, backgroundColor, backgroundColor);

            local titleSize = Vec2(width, 30);
            drawing.drawRectangle(nil, elementPosition, titleSize, titleColor, titleColor, titleColor, titleColor);

            local titlePosition = Vec2(x + (width / 2), y + 3);
            titleTextFont:render(titleString, titlePosition, 0, 0.5, 0.0, titleTextFont.size, titleTextColor, false, false, false, true);
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
        visible = true,
        ID = latestElementID,

        title = title,

        position = position,
        size = size,
    };

    mGuiVisibleElements[latestElementID] = true;

    return mGuiElements[latestElementID];
end

----------------
-- Test Stuff
----------------

--[[
    
local win = mGUIcreateWindow("hello world", Vec2(450, 150), Vec2(400, 300));

setTimeout(
    function()
        win.title = "AYY LMAO";
    end, 5000
);

]]