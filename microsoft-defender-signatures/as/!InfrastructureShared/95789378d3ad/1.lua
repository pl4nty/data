-- Threat: !InfrastructureShared
-- Name: 95789378d3ad
-- Type: 21

if mp.getfilesize() < 10024000 then
  return mp.INFECTED
end
return mp.CLEAN
