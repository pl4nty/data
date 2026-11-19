-- Threat: !InfrastructureShared
-- Name: Foniad
-- Type: 15

local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Policies\\Google\\Chrome")
if l_0_0 then
  local l_0_1 = sysio.GetRegValueAsString(l_0_0, "DefaultNotificationsSetting")
  if l_0_1 ~= nil then
    sysio.DeleteRegValue(l_0_0, "DefaultNotificationsSetting")
  end
end
l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Policies\\Google\\Chrome\\NotificationsAllowedForUrls")
if l_0_0 then
  local l_0_2 = sysio.RegEnumValues(l_0_0)
  if l_0_2 then
    for l_0_3, l_0_4 in pairs(l_0_2) do
      local l_0_5 = sysio.GetRegValueAsString(l_0_0, l_0_4)
      if l_0_5 and string.find(l_0_5, "https://.+%.info") then
        sysio.DeleteRegValue(l_0_0, l_0_4)
      end
    end
  end
end
