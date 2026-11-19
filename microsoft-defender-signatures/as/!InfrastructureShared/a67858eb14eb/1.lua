-- Threat: !InfrastructureShared
-- Name: a67858eb14eb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
