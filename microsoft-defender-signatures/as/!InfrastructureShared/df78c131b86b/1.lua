-- Threat: !InfrastructureShared
-- Name: df78c131b86b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
