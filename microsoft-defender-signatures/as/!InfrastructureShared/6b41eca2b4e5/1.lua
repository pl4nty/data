-- Threat: !InfrastructureShared
-- Name: 6b41eca2b4e5
-- Type: 21

if mp.getfilesize() > 30000 then
  return mp.CLEAN
end
return mp.INFECTED
