-- Threat: !InfrastructureShared
-- Name: 4978bf1f9ca1
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
