-- Threat: !InfrastructureShared
-- Name: 37786f462305
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
