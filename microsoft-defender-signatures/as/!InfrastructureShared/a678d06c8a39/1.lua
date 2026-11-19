-- Threat: !InfrastructureShared
-- Name: a678d06c8a39
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
