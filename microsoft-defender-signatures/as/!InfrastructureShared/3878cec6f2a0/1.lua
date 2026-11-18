-- Threat: !InfrastructureShared
-- Name: 3878cec6f2a0
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
