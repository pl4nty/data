-- Threat: !InfrastructureShared
-- Name: 3878a04f7645
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
