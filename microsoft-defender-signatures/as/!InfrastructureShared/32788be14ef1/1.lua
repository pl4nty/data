-- Threat: !InfrastructureShared
-- Name: 32788be14ef1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
