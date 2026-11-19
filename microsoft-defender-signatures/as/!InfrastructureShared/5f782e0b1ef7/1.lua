-- Threat: !InfrastructureShared
-- Name: 5f782e0b1ef7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
