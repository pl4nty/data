-- Threat: !InfrastructureShared
-- Name: 5b78e727fb7c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 108288 <= l_0_0 and l_0_0 <= 122880 and (pehdr.NumberOfSections >= 4 or pehdr.NumberOfSections <= 6) then
  return mp.INFECTED
end
return mp.CLEAN
