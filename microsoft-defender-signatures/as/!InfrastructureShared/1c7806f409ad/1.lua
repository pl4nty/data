-- Threat: !InfrastructureShared
-- Name: 1c7806f409ad
-- Type: 21

if pesecs[4].Name == ".btls2" and pesecs[6].Name == ".dcard" then
  return mp.INFECTED
end
return mp.CLEAN
