-- Threat: !InfrastructureShared
-- Name: 1fb78c3821142
-- Type: 21

if mp.getfilesize() > 50000000 then
  return mp.INFECTED
end
return mp.CLEAN
