-- Threat: !InfrastructureShared
-- Name: 1227868a9f422
-- Type: 21

if mp.getfilesize() >= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
