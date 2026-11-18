-- Threat: !InfrastructureShared
-- Name: 62782abbd119
-- Type: 21

if pesecs[7].Name == ".mackt" and pesecs[8].Name == ".topo0" and pesecs[13].Name == ".Orion" then
  return mp.INFECTED
end
return mp.CLEAN
