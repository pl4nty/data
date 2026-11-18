-- Threat: !InfrastructureShared
-- Name: 657810e6e8b9
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
