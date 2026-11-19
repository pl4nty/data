-- Threat: !InfrastructureShared
-- Name: e878eeb7e35b
-- Type: 21

local l_0_0 = mp.getfilesize()
if pehdr.NumberOfSections == 9 and 32768 <= l_0_0 and l_0_0 <= 49152 then
  return mp.INFECTED
end
return mp.CLEAN
