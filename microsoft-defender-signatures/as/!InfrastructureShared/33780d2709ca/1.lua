-- Threat: !InfrastructureShared
-- Name: 33780d2709ca
-- Type: 21

if epcode[1] == 72 and epcode[2] == 137 then
  return mp.INFECTED
end
return mp.CLEAN
