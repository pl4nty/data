-- Threat: !InfrastructureShared
-- Name: 8d788736a5d0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
