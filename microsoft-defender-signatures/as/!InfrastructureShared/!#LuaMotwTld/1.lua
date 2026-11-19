-- Threat: !InfrastructureShared
-- Name: !#Lua:MotwTld
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:MotwZone_3

local l_0_0 = mp.GetMOTWHostUrl()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0:match("https?://.-%.(%a+)/")
  if l_0_1 then
    mp.set_mpattribute("Lua:MotwTld_" .. l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
