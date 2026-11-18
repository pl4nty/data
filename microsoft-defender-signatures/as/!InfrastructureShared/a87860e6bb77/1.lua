-- Threat: !InfrastructureShared
-- Name: a87860e6bb77
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
