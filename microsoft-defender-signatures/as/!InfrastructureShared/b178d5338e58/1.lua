-- Threat: !InfrastructureShared
-- Name: b178d5338e58
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
