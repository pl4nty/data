-- Threat: !InfrastructureShared
-- Name: 87fcb8190f9
-- Type: 21

if epcode[1] == 85 and epcode[2] == 144 and epcode[3] == 84 and epcode[4] == 93 then
  return mp.INFECTED
end
return mp.CLEAN
