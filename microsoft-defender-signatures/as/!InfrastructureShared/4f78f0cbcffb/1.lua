-- Threat: !InfrastructureShared
-- Name: 4f78f0cbcffb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
