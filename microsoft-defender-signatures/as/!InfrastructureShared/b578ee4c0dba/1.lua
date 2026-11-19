-- Threat: !InfrastructureShared
-- Name: b578ee4c0dba
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
