-- Threat: !InfrastructureShared
-- Name: 4f788f739000
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
