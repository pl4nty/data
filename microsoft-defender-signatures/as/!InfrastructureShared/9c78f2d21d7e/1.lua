-- Threat: !InfrastructureShared
-- Name: 9c78f2d21d7e
-- Type: 21

if mp.getfilesize() < 50000 then
  return mp.CLEAN
end
return mp.INFECTED
