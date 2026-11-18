-- Threat: !InfrastructureShared
-- Name: 45403b94d52d
-- Type: 21

local l_0_0 = mp.getfilesize()
if 35000 < l_0_0 or l_0_0 < 25000 then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData ~= 1536 then
  return mp.CLEAN
end
return mp.INFECTED
