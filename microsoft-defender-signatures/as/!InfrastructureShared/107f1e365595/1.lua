-- Threat: !InfrastructureShared
-- Name: 107f1e365595
-- Type: 21

if epcode[1] == 184 and epcode[6] == 255 and epcode[7] == 224 or epcode[1] == 104 and epcode[6] == 232 then
  return mp.LOWFI
end
return mp.CLEAN
