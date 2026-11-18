-- Threat: !InfrastructureShared
-- Name: f178dedaed4e
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and (l_0_0 == 151552 or l_0_0 == 147456) then
  return mp.INFECTED
end
return mp.CLEAN
