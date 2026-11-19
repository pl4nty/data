-- Threat: !InfrastructureShared
-- Name: 7fd3184e1405
-- Type: 21

if mp.getfilesize() < 850000 then
  return mp.INFECTED
end
return mp.CLEAN
