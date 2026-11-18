-- Threat: !InfrastructureShared
-- Name: 8978997044d6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
