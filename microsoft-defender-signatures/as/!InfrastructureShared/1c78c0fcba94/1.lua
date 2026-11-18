-- Threat: !InfrastructureShared
-- Name: 1c78c0fcba94
-- Type: 21

if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 102 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
