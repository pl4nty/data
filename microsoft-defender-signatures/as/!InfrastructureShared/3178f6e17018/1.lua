-- Threat: !InfrastructureShared
-- Name: 3178f6e17018
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
