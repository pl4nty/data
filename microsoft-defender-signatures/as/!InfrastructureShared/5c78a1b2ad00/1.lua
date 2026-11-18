-- Threat: !InfrastructureShared
-- Name: 5c78a1b2ad00
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
