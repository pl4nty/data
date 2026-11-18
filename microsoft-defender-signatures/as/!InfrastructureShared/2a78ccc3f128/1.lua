-- Threat: !InfrastructureShared
-- Name: 2a78ccc3f128
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
