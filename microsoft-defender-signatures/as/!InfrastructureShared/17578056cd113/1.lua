-- Threat: !InfrastructureShared
-- Name: 17578056cd113
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
