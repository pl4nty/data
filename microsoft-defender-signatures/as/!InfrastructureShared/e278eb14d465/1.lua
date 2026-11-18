-- Threat: !InfrastructureShared
-- Name: e278eb14d465
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
