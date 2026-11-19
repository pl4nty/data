-- Threat: !InfrastructureShared
-- Name: 4178f4aebe83
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and (l_0_0 == 135168 or l_0_0 == 139264) then
  return mp.INFECTED
end
return mp.CLEAN
