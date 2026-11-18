-- Threat: !InfrastructureShared
-- Name: 7078f13c64f5
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
