-- Threat: !InfrastructureShared
-- Name: d17896796ee5
-- Type: 21

if mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
