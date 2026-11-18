-- Threat: !InfrastructureShared
-- Name: 1eb7880c51b5a
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
