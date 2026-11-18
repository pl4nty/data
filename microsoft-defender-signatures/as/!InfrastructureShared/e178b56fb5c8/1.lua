-- Threat: !InfrastructureShared
-- Name: e178b56fb5c8
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
