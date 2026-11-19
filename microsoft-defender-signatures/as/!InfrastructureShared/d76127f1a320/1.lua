-- Threat: !InfrastructureShared
-- Name: d76127f1a320
-- Type: 21

if pesecs[5].Name == ".air0" and pesecs[6].Name == ".air1" then
  return mp.INFECTED
end
return mp.CLEAN
