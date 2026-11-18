-- Threat: !InfrastructureShared
-- Name: 42789308e717
-- Type: 21

local l_0_0 = mp.getfilesize()
if 512000 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pesecs[1].SizeOfRawData
if l_0_1 < 65536 then
  return mp.CLEAN
end
if peattributes.isvbnative == true then
  return mp.INFECTED
end
return mp.CLEAN
