-- Threat: !InfrastructureShared
-- Name: 9378d36db4a7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
