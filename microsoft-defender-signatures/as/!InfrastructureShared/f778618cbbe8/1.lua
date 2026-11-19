-- Threat: !InfrastructureShared
-- Name: f778618cbbe8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isexe == true and l_0_0 < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
