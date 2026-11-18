-- Threat: !InfrastructureShared
-- Name: ce78837d3e0d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
