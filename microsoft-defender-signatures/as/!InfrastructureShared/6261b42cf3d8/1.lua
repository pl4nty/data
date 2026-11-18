-- Threat: !InfrastructureShared
-- Name: 6261b42cf3d8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 1669632 <= l_0_0 and l_0_0 <= 1677824 then
  return mp.INFECTED
end
return mp.CLEAN
