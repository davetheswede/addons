local DISPLAY_SECONDS = 10
local MESSAGE = "Hatt! Hatt! HATT HATT!!"

local display = CreateFrame("Frame", "HattDisplay", UIParent)
display:SetAllPoints(UIParent)
display:Hide()

local text = display:CreateFontString(nil, "OVERLAY")
text:SetFont(STANDARD_TEXT_FONT, 48, "OUTLINE")
text:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
text:SetText(MESSAGE)

local timeLeft = 0
display:SetScript("OnUpdate", function(self, elapsed)
    timeLeft = timeLeft - elapsed
    if timeLeft <= 0 then
        self:Hide()
    end
end)

local events = CreateFrame("Frame")
events:RegisterEvent("CHAT_MSG_LOOT")
events:SetScript("OnEvent", function(_, _, message, _, isSelf)
    -- Only react to loot marked as the player's own by the loot event.
    if not isSelf or type(message) ~= "string" then
        return
    end

    local itemID = tonumber(message:match("|Hitem:(%d+):"))
    if not itemID or not GetItemInfoInstant then
        return
    end

    local _, _, _, inventoryType = GetItemInfoInstant(itemID)
    if inventoryType == "INVTYPE_HEAD" then
        timeLeft = DISPLAY_SECONDS
        display:Show()
    end
end)
