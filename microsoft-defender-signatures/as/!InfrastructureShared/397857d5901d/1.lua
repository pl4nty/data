-- Threat: !InfrastructureShared
-- Name: 397857d5901d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
