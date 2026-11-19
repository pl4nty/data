-- Threat: !InfrastructureShared
-- Name: 11c785bc307a4
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
