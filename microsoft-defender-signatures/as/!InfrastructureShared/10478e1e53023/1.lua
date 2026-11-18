-- Threat: !InfrastructureShared
-- Name: 10478e1e53023
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
