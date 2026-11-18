-- Threat: !InfrastructureShared
-- Name: 7678bf97f611
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
