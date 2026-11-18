-- Threat: !InfrastructureShared
-- Name: bd78d6fd5e6a
-- Type: 21

if mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
