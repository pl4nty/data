-- Threat: !InfrastructureShared
-- Name: 7878b1b5741f
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
