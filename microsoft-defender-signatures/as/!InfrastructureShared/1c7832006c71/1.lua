-- Threat: !InfrastructureShared
-- Name: 1c7832006c71
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 204800 <= l_0_0 and l_0_0 <= 460800 then
  return mp.INFECTED
end
return mp.CLEAN
