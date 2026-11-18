-- Threat: !InfrastructureShared
-- Name: 3b290bd1a29a
-- Type: 21

if mp.getfilesize() > 30720 and mp.getfilesize() < 849920 then
  return mp.INFECTED
end
return mp.CLEAN
