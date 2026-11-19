-- Threat: !InfrastructureShared
-- Name: 3978225aa105
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
