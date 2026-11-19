-- Threat: !InfrastructureShared
-- Name: 9d7849d2b8e7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
