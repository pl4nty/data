-- Threat: !InfrastructureShared
-- Name: 28780b527285
-- Type: 21

local l_0_0 = mp.getfilesize()
if 140000 <= l_0_0 and l_0_0 <= 146000 and pehdr.NumberOfSections >= 6 and pehdr.NumberOfSections <= 7 then
  return mp.INFECTED
end
return mp.CLEAN
