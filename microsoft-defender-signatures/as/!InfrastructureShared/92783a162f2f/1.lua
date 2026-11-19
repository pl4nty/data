-- Threat: !InfrastructureShared
-- Name: 92783a162f2f
-- Type: 21

if pesecs[5].Name == ".rrdata" and pesecs[6].Name == ".lif\a" then
  return mp.INFECTED
end
return mp.CLEAN
