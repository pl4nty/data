-- Threat: !InfrastructureShared
-- Name: 157829321f22
-- Type: 21

if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 6 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
