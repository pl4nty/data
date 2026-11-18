-- Threat: !InfrastructureShared
-- Name: 26787bd32157
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
