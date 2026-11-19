-- Threat: !InfrastructureShared
-- Name: 4f78d4a73293
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
