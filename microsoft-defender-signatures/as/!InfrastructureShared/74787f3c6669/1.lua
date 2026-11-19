-- Threat: !InfrastructureShared
-- Name: 74787f3c6669
-- Type: 21

if epcode[1] == 184 and epcode[6] == 187 and epcode[11] == 232 and epcode[12] == 5 then
  return mp.INFECTED
end
return mp.CLEAN
