-- Threat: !InfrastructureShared
-- Name: 457827834fd6
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isexe == true and l_0_0 < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
