-- Threat: !InfrastructureShared
-- Name: 4178ebfad241
-- Type: 21

local l_0_0 = mp.getfilesize()
if 131072 < l_0_0 and l_0_0 < 421888 then
  return mp.INFECTED
end
return mp.CLEAN
