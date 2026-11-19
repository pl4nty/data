-- Threat: !InfrastructureShared
-- Name: 5a78c15924c8
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
