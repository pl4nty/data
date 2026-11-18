-- Threat: !InfrastructureShared
-- Name: 207856619242
-- Type: 21

if epcode[1] == 96 and epcode[2] == 232 and epcode[3] == 0 and epcode[4] == 0 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
