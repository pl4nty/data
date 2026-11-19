-- Threat: !InfrastructureShared
-- Name: 4b781ac3f15f
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
