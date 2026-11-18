-- Threat: !InfrastructureShared
-- Name: 7878a49d33cb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
