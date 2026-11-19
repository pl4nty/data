-- Threat: !InfrastructureShared
-- Name: 7941671d2fcb
-- Type: 21

if pesecs[1].VirtualSize > 45056 and pesecs[1].VirtualSize < 61440 and pesecs[2].VirtualSize > 768 and pesecs[2].VirtualSize < 1536 then
  return mp.INFECTED
end
return mp.CLEAN
