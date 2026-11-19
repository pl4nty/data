-- Threat: !InfrastructureShared
-- Name: 95780f1f3030
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
