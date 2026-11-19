-- Threat: !InfrastructureShared
-- Name: 78782ba2a35b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1703936 <= l_0_0 and l_0_0 <= 1769472 and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
