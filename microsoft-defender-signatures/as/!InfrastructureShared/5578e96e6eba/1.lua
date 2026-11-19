-- Threat: !InfrastructureShared
-- Name: 5578e96e6eba
-- Type: 21

if mp.getfilesize() < 1064000 then
  return mp.INFECTED
end
return mp.CLEAN
