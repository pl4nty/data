-- Threat: !InfrastructureShared
-- Name: 5778c3ac0e1e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
