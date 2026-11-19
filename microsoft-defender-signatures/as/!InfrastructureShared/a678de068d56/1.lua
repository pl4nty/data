-- Threat: !InfrastructureShared
-- Name: a678de068d56
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3072000 then
  return mp.INFECTED
end
return mp.CLEAN
