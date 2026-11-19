-- Threat: !InfrastructureShared
-- Name: 807868b970ce
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
