-- Threat: !InfrastructureShared
-- Name: 5478f740a41c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
