-- Threat: !InfrastructureShared
-- Name: 4e7851d0f743
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
