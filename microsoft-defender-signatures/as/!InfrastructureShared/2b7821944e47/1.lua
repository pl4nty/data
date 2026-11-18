-- Threat: !InfrastructureShared
-- Name: 2b7821944e47
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
