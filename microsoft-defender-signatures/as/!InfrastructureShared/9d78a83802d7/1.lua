-- Threat: !InfrastructureShared
-- Name: 9d78a83802d7
-- Type: 21

if epcode[1] == 104 and epcode[2] == 20 then
  return mp.INFECTED
end
return mp.CLEAN
