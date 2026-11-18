-- Threat: !InfrastructureShared
-- Name: a54050118ce3
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
