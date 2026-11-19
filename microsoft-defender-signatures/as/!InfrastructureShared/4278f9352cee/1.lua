-- Threat: !InfrastructureShared
-- Name: 4278f9352cee
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isvbnative and 327680 <= l_0_0 and l_0_0 <= 524288 then
  return mp.INFECTED
end
return mp.CLEAN
