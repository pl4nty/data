-- Threat: !InfrastructureShared
-- Name: 1d3784680db50
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
