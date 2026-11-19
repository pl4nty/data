-- Threat: !InfrastructureShared
-- Name: 4878cd6fcd6d
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
