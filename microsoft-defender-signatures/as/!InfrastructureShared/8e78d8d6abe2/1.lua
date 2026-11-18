-- Threat: !InfrastructureShared
-- Name: 8e78d8d6abe2
-- Type: 21

if mp.getfilesize() < 92928 then
  return mp.INFECTED
end
return mp.CLEAN
