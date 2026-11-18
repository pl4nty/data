-- Threat: !InfrastructureShared
-- Name: 5778461c8aeb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
