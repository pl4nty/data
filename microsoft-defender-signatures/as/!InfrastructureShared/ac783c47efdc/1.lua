-- Threat: !InfrastructureShared
-- Name: ac783c47efdc
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
