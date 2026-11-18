-- Threat: !InfrastructureShared
-- Name: 139614b024178
-- Type: 21

if mp.getfilesize() >= 43000000 and mp.getfilesize() <= 49000000 then
  return mp.INFECTED
end
return mp.CLEAN
