-- Threat: !InfrastructureShared
-- Name: 2a78a9ac34e8
-- Type: 21

if mp.getfilesize() > 18000000 then
  return mp.INFECTED
end
return mp.CLEAN
