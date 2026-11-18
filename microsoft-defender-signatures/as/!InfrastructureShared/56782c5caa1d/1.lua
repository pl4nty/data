-- Threat: !InfrastructureShared
-- Name: 56782c5caa1d
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
