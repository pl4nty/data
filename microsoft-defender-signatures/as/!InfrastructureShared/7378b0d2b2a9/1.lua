-- Threat: !InfrastructureShared
-- Name: 7378b0d2b2a9
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
