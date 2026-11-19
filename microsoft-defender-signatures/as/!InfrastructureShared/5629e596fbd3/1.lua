-- Threat: !InfrastructureShared
-- Name: 5629e596fbd3
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1536 then
  return mp.INFECTED
end
return mp.CLEAN
