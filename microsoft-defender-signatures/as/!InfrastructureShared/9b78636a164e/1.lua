-- Threat: !InfrastructureShared
-- Name: 9b78636a164e
-- Type: 21

if peattributes.isexe and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
