-- Threat: !InfrastructureShared
-- Name: b57897507ee9
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
