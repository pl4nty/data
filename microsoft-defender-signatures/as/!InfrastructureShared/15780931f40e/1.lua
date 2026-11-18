-- Threat: !InfrastructureShared
-- Name: 15780931f40e
-- Type: 21

if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 86 and peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
