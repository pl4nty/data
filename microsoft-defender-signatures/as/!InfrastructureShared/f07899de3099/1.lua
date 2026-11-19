-- Threat: !InfrastructureShared
-- Name: f07899de3099
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
