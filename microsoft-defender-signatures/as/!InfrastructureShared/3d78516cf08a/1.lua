-- Threat: !InfrastructureShared
-- Name: 3d78516cf08a
-- Type: 21

if mp.getfilesize() < 6000000 then
  return mp.INFECTED
end
return mp.CLEAN
