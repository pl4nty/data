-- Threat: !InfrastructureShared
-- Name: 5f78abf2d914
-- Type: 21

if mp.getfilesize() > 300000 then
  return mp.CLEAN
end
return mp.INFECTED
