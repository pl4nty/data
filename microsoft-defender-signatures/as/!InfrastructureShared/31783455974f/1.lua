-- Threat: !InfrastructureShared
-- Name: 31783455974f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
