-- Threat: !InfrastructureShared
-- Name: 5778a35ef2a9
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
