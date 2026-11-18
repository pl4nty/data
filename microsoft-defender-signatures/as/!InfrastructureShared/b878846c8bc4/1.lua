-- Threat: !InfrastructureShared
-- Name: b878846c8bc4
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isvbnative and 512000 <= l_0_0 and l_0_0 <= 716800 then
  return mp.INFECTED
end
return mp.CLEAN
