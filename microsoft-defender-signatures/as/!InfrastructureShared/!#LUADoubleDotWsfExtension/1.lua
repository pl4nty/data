-- Threat: !InfrastructureShared
-- Name: !#LUA:DoubleDotWsfExtension
-- Type: 13

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 6 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -5)
if l_0_1 == "..wsf" then
  return mp.INFECTED
end
return mp.CLEAN
