-- Threat: !InfrastructureShared
-- Name: 1197857007249
-- Type: 21

if mp.getfilesize() < 78848 then
  return mp.INFECTED
end
return mp.CLEAN
