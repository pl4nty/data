-- Threat: !InfrastructureShared
-- Name: 73788d1b6b59
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
