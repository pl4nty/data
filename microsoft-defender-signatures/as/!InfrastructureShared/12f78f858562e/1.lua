-- Threat: !InfrastructureShared
-- Name: 12f78f858562e
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
