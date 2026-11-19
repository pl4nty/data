-- Threat: !InfrastructureShared
-- Name: ba78ae6e0857
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
