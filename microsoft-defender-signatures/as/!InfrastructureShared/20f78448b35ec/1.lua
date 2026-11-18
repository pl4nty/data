-- Threat: !InfrastructureShared
-- Name: 20f78448b35ec
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
