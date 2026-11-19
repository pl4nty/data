-- Threat: !InfrastructureShared
-- Name: dd78f2118b94
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
