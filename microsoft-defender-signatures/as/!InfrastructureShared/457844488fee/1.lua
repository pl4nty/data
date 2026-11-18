-- Threat: !InfrastructureShared
-- Name: 457844488fee
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
