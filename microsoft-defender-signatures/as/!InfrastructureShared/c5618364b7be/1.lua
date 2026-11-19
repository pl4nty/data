-- Threat: !InfrastructureShared
-- Name: c5618364b7be
-- Type: 21

if mp.getfilesize() < 600000 then
  return mp.INFECTED
end
return mp.CLEAN
