-- Threat: !InfrastructureShared
-- Name: 1478412691c8
-- Type: 21

if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 58 and peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
