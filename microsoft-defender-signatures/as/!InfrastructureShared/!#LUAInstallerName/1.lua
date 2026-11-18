-- Threat: !InfrastructureShared
-- Name: !#LUA:InstallerName
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil and #l_0_0 < 5 then
  return mp.CLEAN
end
if l_0_0:find("setup", 1, true) or l_0_0:find("install", 1, true) or l_0_0:find("x32", 1, true) or l_0_0:find("x64", 1, true) then
  mp.set_mpattribute("Lua:SetupName")
end
return mp.CLEAN
