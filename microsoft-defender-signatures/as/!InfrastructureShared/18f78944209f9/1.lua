-- Threat: !InfrastructureShared
-- Name: 18f78944209f9
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
