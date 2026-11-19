-- Threat: !InfrastructureShared
-- Name: 9e78c92f587a
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
