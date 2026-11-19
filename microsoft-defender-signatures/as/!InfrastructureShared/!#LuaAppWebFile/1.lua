-- Threat: !InfrastructureShared
-- Name: !#Lua:AppWebFile
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if not mp.get_mpattributesubstring("Lua:PeOriginalName!app_web_") then
  return mp.CLEAN
end
local l_0_0 = mp.enum_mpattributesubstring("Lua:PeOriginalName!app_web_")
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
if #l_0_0 == 1 then
  local l_0_1 = l_0_0[#l_0_0]
  if #l_0_1 == 39 then
    return mp.INFECTED
  end
end
return mp.CLEAN
