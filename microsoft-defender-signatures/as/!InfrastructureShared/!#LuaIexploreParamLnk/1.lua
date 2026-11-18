-- Threat: !InfrastructureShared
-- Name: !#Lua:IexploreParamLnk
-- Type: 13
-- MpAttributes: SCPT:IexploreParamLnk

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 60 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_1:len() > 50 and (string.sub(l_0_2, 1, 21) == "internet explorer.lnk" or string.sub(l_0_2, 1, 34) == "internet explorer (no add-ons).lnk" or string.sub(l_0_2, 1, 36) == "launch internet explorer browser.lnk") and (l_0_1:find("\\microsoft\\internet explorer\\quick launch", 1, true) ~= nil or string.sub(l_0_1, -21) == "\\start menu\\programs\\" or string.sub(l_0_1, -46) == "\\start menu\\programs\\accessories\\system tools\\" or string.sub(l_0_1, -33) == "\\start menu\\programs\\accessories\\") then
  mp.set_mpattribute("Lua:IexploreParamLnk")
end
return mp.CLEAN
