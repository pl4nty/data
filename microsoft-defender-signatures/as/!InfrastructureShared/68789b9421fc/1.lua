-- Threat: !InfrastructureShared
-- Name: 68789b9421fc
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
