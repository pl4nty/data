-- Threat: !InfrastructureShared
-- Name: 45404e2437b6
-- Type: 21

if mp.getfilesize() > 9000 then
  return mp.CLEAN
end
return mp.INFECTED
