-- Threat: !InfrastructureShared
-- Name: 147800daa3d4
-- Type: 21

if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 98 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
