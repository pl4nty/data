-- Threat: !InfrastructureShared
-- Name: 135783e2fe90a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
