-- Threat: !InfrastructureShared
-- Name: 356123aac2e8
-- Type: 21

local l_0_0 = mp.getfilesize()
if pehdr.NumberOfSections == 6 and 5868504 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
