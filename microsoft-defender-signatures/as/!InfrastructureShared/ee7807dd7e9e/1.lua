-- Threat: !InfrastructureShared
-- Name: ee7807dd7e9e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
