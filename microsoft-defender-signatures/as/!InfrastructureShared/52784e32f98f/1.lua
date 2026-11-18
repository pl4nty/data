-- Threat: !InfrastructureShared
-- Name: 52784e32f98f
-- Type: 21

if mp.getfilesize() < 51000 then
  return mp.INFECTED
end
return mp.CLEAN
