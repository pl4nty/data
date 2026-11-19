-- Threat: !InfrastructureShared
-- Name: 2b540e54998fa
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
