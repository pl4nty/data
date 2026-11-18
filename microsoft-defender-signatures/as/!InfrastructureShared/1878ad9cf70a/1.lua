-- Threat: !InfrastructureShared
-- Name: 1878ad9cf70a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 102400 <= l_0_0 and l_0_0 <= 204800 then
  return mp.INFECTED
end
return mp.CLEAN
