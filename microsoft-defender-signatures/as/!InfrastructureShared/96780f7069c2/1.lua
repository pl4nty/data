-- Threat: !InfrastructureShared
-- Name: 96780f7069c2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
