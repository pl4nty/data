-- Threat: !InfrastructureShared
-- Name: !#Lua:Wpbbin.A
-- Type: 13

if not mp.get_mpattribute("Lua:Wpbbin.A!cert") then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 28 or string.sub(l_0_0, -28) ~= "\\windows\\system32\\wpbbin.exe" then
  return mp.CLEAN
end
return mp.INFECTED
