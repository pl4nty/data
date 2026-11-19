-- Threat: !InfrastructureShared
-- Name: 292947a7c9d2
-- Type: 21

if not mp.get_mpattribute("SCPT:JS/Cryxos.HBX5") then
  return mp.CLEAN
end
local l_0_0 = 409600
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = ".split(\"\144\002\016\").join(\"\").split(\"\144\002\016\").join(\"\").replace(/^\\s+|\\s+$/g, \"\");\144\000"
local l_0_3 = mp.BMSearchFile(l_0_1 / 2, l_0_1, l_0_2)
if l_0_3 == -1 then
  return mp.CLEAN
end
return mp.INFECTED
