-- Threat: !InfrastructureShared
-- Name: 21788db4e268
-- Type: 21

if epcode[1] == 65 and epcode[2] == 85 and epcode[3] == 81 and epcode[4] == 156 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
