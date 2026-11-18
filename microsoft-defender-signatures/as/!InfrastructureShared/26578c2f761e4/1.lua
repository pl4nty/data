-- Threat: !InfrastructureShared
-- Name: 26578c2f761e4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
