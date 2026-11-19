-- Threat: !InfrastructureShared
-- Name: 5d784d607364
-- Type: 21

if mp.getfilesize() < 15360 then
  return mp.INFECTED
end
return mp.CLEAN
