-- Threat: !InfrastructureShared
-- Name: 6f78d77dcc73
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
