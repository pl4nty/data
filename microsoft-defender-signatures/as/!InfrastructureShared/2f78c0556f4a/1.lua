-- Threat: !InfrastructureShared
-- Name: 2f78c0556f4a
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
