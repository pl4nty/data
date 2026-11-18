-- Threat: !InfrastructureShared
-- Name: 7b782e25e77d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
