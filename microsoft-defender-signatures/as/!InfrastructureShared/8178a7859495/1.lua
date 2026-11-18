-- Threat: !InfrastructureShared
-- Name: 8178a7859495
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
