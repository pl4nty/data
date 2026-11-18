-- Threat: !InfrastructureShared
-- Name: b07834205b9d
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
