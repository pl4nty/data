-- Threat: !InfrastructureShared
-- Name: 15789b4793da
-- Type: 21

if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 168 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
