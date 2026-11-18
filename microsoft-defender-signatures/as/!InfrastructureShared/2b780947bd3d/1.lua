-- Threat: !InfrastructureShared
-- Name: 2b780947bd3d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
