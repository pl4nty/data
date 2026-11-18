-- Threat: !InfrastructureShared
-- Name: d2784b68c849
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 4048000 then
  return mp.INFECTED
end
return mp.CLEAN
