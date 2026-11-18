-- Threat: !InfrastructureShared
-- Name: 3978e7dd5941
-- Type: 21

local l_0_0 = mp.getfilesize()
if 210000 <= l_0_0 and l_0_0 <= 240000 and pehdr.NumberOfSections >= 6 and pehdr.NumberOfSections <= 7 then
  return mp.INFECTED
end
return mp.CLEAN
