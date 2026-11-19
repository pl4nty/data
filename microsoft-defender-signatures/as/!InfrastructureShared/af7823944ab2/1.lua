-- Threat: !InfrastructureShared
-- Name: af7823944ab2
-- Type: 21

if mp.getfilesize() < 3100000 then
  return mp.INFECTED
end
return mp.CLEAN
