-- Threat: !InfrastructureShared
-- Name: 10278035ae4ea
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
