-- Threat: !InfrastructureShared
-- Name: f5786521b0c4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
