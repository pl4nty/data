-- Threat: !InfrastructureShared
-- Name: 50787236492a
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 2700000 and mp.getfilesize() > 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
