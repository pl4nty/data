-- Threat: !InfrastructureShared
-- Name: 34789d3ea5cc
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
