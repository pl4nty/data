-- Threat: !InfrastructureShared
-- Name: 26292985a9f9
-- Type: 21

local l_0_0 = mp.getfilesize()
if 300 < l_0_0 or l_0_0 < 100 then
  return mp.CLEAN
end
return mp.INFECTED
