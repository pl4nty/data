-- Threat: !InfrastructureShared
-- Name: 2b78d9980f59
-- Type: 21

if mp.getfilesize() < 130000 then
  return mp.INFECTED
end
return mp.CLEAN
