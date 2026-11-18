-- Threat: !InfrastructureShared
-- Name: 8540ec1dfd73
-- Type: 21

local l_0_0 = mp.getfilesize()
if 983040 <= l_0_0 and l_0_0 <= 1179648 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
