-- Threat: !InfrastructureShared
-- Name: 4d788668a4c4
-- Type: 21

if epcode[1] == 104 and epcode[6] == 195 and epcode[7] == 144 then
  return mp.INFECTED
end
return mp.CLEAN
