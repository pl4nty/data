-- Threat: !InfrastructureShared
-- Name: 2778e4d232d9
-- Type: 21

if epcode[1] == 51 and epcode[2] == 192 then
  return mp.INFECTED
end
return mp.CLEAN
