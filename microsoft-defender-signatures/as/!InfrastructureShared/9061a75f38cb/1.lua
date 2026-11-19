-- Threat: !InfrastructureShared
-- Name: 9061a75f38cb
-- Type: 21

local l_0_0 = mp.getfilesize()
if 386048 <= l_0_0 and l_0_0 <= 576000 and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
