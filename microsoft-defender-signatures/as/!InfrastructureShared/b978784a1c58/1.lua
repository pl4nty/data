-- Threat: !InfrastructureShared
-- Name: b978784a1c58
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 4100 then
  return mp.INFECTED
end
return mp.CLEAN
