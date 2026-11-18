-- Threat: !InfrastructureShared
-- Name: b3781454e557
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
