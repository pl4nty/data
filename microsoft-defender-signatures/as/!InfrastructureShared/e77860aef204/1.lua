-- Threat: !InfrastructureShared
-- Name: e77860aef204
-- Type: 21

local l_0_0 = mp.getfilesize()
if 307200 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
