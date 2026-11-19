-- Threat: !InfrastructureShared
-- Name: 44789f58f045
-- Type: 21

if epcode[1] == 232 and epcode[2] == 0 and epcode[3] == 0 and epcode[4] == 0 then
  return mp.INFECTED
end
return mp.CLEAN
