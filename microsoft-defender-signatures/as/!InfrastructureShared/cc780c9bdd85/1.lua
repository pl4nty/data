-- Threat: !InfrastructureShared
-- Name: cc780c9bdd85
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
