-- Threat: !InfrastructureShared
-- Name: 3540c6012670
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and 32768 <= l_0_0 and l_0_0 <= 34048 then
  return mp.INFECTED
end
return mp.CLEAN
