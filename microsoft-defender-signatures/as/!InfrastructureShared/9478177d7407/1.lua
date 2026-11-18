-- Threat: !InfrastructureShared
-- Name: 9478177d7407
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
