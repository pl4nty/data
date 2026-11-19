-- Threat: !InfrastructureShared
-- Name: 7a781e0dc744
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5600000 then
  return mp.INFECTED
end
return mp.CLEAN
