-- Threat: !InfrastructureShared
-- Name: 3678eff7476e
-- Type: 21

if epcode[1] == 0 and epcode[2] == 68 and epcode[3] == 137 then
  return mp.INFECTED
end
return mp.CLEAN
