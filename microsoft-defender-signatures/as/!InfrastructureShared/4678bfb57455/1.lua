-- Threat: !InfrastructureShared
-- Name: 4678bfb57455
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
