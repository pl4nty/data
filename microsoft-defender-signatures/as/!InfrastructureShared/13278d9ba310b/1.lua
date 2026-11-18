-- Threat: !InfrastructureShared
-- Name: 13278d9ba310b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 16777216 then
  return mp.INFECTED
end
return mp.CLEAN
