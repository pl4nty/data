-- Threat: !InfrastructureShared
-- Name: 2778e9c186fe
-- Type: 21

if peattributes.no_security and pesecs[3].Name == ".rdata" and pesecs[3].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
