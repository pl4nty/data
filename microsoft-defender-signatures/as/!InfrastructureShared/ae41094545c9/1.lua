-- Threat: !InfrastructureShared
-- Name: ae41094545c9
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
