-- Threat: !InfrastructureShared
-- Name: cd78769c4fda
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
