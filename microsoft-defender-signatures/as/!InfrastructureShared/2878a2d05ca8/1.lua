-- Threat: !InfrastructureShared
-- Name: 2878a2d05ca8
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
