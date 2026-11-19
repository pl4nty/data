-- Threat: !InfrastructureShared
-- Name: 8378debc6927
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
