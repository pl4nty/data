-- Threat: !InfrastructureShared
-- Name: c28c125ea119
-- Type: 21

if mp.getfilesize() >= 75008 and mp.getfilesize() <= 208640 then
  return mp.INFECTED
end
return mp.CLEAN
