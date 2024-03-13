local collapsed = true

local frame = CreateFrame("Frame", "AddonFrame", UIParent)
frame:SetSize(24, 24)
frame:SetPoint("CENTER")
frame:EnableMouse(true)
frame:SetMovable(true)
frame:SetUserPlaced(true)
frame:SetClampedToScreen(true)
frame:SetScript("OnMouseDown", function(self, button)
    self:StartMoving()
end)
frame:SetScript("OnMouseUp", function(self, button)
    self:StopMovingOrSizing()
end)
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
frame:SetBackdropColor(0, 0, 0, 1)

local editBox = CreateFrame("EditBox", "ItemNameEditBox", frame, "InputBoxTemplate")
editBox:SetSize(150, 20)
editBox:SetPoint("TOP", 0, -15)
editBox:SetAutoFocus(false)
editBox:Hide()

local searchButton = CreateFrame("Button", "SearchButton", frame, "UIPanelButtonTemplate")
searchButton:SetSize(80, 20)
searchButton:SetPoint("TOP", editBox, "BOTTOM", 0, -5)
searchButton:SetText("Поиск")
searchButton:Hide()

editBox:SetScript("OnEnterPressed", function()
    PrintItemLink()
end)
searchButton:SetScript("OnClick", function()
    PrintItemLink()
end)

function PrintItemLink()
    local inputText = editBox:GetText()
    local itemLink = select(2, GetItemInfo(inputText))
    print(itemLink)
end

local collapseButton = CreateFrame("Button", "CollapseButton", frame, "UIPanelButtonTemplate") 
collapseButton:SetSize(20, 20) 
collapseButton:SetPoint("TOPRIGHT", -2, -2) 
collapseButton:SetText("+")

collapseButton:SetScript("OnClick", function() 
    if collapsed then 
        frame:SetSize(200, 65)
        editBox:Show()
        searchButton:Show()
        collapseButton:SetText("-") 
        collapsed = false 
    else 
        frame:SetSize(24, 24)
        editBox:Hide()
        searchButton:Hide()
        collapseButton:SetText("+") 
        collapsed = true 
    end 
end)
