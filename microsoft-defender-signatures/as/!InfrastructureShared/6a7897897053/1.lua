-- Threat: !InfrastructureShared
-- Name: 6a7897897053
-- Type: 21

if mp.getfilesize() >= 20480 then
  return mp.CLEAN
end
return mp.INFECTED
