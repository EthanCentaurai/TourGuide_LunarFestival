
local F = CreateFrame("Frame")
F:Hide()
F:SetScript("OnEvent", function(self, event, msg)
	local action, quest = TourGuide:GetObjectiveInfo()

	if action == "TURNIN" then
		local _, _, text = msg:find("^(.-) completed%.$")

		if text and quest == text then
			return TourGuide:SetTurnedIn(text, true, false)
		end
	end
end)

F:RegisterEvent("CHAT_MSG_SYSTEM")

