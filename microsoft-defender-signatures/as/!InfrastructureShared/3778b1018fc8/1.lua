-- Threat: !InfrastructureShared
-- Name: 3778b1018fc8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
