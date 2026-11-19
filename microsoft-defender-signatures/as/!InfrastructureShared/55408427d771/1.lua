-- Threat: !InfrastructureShared
-- Name: 55408427d771
-- Type: 21

if mp.getfilesize() > 550000 and mp.getfilesize() < 600000 then
  return mp.INFECTED
end
return mp.CLEAN
