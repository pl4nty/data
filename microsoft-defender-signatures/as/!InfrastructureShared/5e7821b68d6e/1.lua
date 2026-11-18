-- Threat: !InfrastructureShared
-- Name: 5e7821b68d6e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
