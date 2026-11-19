-- Threat: !InfrastructureShared
-- Name: 3578f3f9e58a
-- Type: 21

if epcode[1] == 131 and epcode[2] == 236 and epcode[30] == 185 and epcode[35] == 128 and epcode[36] == 48 then
  return mp.INFECTED
end
return mp.CLEAN
