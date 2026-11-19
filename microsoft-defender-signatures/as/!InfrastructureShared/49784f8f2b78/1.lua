-- Threat: !InfrastructureShared
-- Name: 49784f8f2b78
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
