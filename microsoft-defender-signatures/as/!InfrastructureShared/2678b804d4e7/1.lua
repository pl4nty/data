-- Threat: !InfrastructureShared
-- Name: 2678b804d4e7
-- Type: 21

if epcode[1] == 83 and epcode[2] == 232 and epcode[3] == 193 and epcode[4] == 131 and peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
