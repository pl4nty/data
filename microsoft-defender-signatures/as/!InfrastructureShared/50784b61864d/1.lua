-- Threat: !InfrastructureShared
-- Name: 50784b61864d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
