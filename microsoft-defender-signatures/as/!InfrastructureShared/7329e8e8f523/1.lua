-- Threat: !InfrastructureShared
-- Name: 7329e8e8f523
-- Type: 21

local l_0_0 = mp.getfilesize()
if 983040 <= l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
