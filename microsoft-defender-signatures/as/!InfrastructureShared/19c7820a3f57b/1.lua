-- Threat: !InfrastructureShared
-- Name: 19c7820a3f57b
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 790000 and mp.getfilesize() < 800000 then
  return mp.INFECTED
end
return mp.CLEAN
