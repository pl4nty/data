-- Threat: !InfrastructureShared
-- Name: 9678567089d4
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
