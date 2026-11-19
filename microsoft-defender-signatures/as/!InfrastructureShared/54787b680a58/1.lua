-- Threat: !InfrastructureShared
-- Name: 54787b680a58
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
