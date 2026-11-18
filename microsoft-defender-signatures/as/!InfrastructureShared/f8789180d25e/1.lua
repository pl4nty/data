-- Threat: !InfrastructureShared
-- Name: f8789180d25e
-- Type: 21

if mp.getfilesize() < 2064000 then
  return mp.INFECTED
end
return mp.CLEAN
