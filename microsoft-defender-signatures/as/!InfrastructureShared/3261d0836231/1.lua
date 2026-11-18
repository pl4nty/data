-- Threat: !InfrastructureShared
-- Name: 3261d0836231
-- Type: 21

local l_0_0 = mp.getfilesize()
if pehdr.NumberOfSections == 6 and 15000000 <= l_0_0 and l_0_0 <= 22000000 then
  return mp.INFECTED
end
return mp.CLEAN
