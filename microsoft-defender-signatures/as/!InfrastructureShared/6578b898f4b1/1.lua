-- Threat: !InfrastructureShared
-- Name: 6578b898f4b1
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
