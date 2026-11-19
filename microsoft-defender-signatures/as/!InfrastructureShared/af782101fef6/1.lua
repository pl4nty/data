-- Threat: !InfrastructureShared
-- Name: af782101fef6
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 600000 and 500000 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
