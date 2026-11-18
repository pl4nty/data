-- Threat: !InfrastructureShared
-- Name: f2789e2e62e
-- Type: 21

if mp.getfilesize() <= 4096 then
  return mp.INFECTED
end
return mp.CLEAN
