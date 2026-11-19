-- Threat: !InfrastructureShared
-- Name: ee781708a6b8
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
