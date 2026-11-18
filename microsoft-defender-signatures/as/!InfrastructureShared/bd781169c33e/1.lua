-- Threat: !InfrastructureShared
-- Name: bd781169c33e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
