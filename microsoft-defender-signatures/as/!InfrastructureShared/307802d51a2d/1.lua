-- Threat: !InfrastructureShared
-- Name: 307802d51a2d
-- Type: 21

if mp.getfilesize() < 6000 then
  return mp.INFECTED
end
return mp.CLEAN
