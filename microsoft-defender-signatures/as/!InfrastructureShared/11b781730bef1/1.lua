-- Threat: !InfrastructureShared
-- Name: 11b781730bef1
-- Type: 21

if mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
