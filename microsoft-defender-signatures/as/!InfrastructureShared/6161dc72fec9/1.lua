-- Threat: !InfrastructureShared
-- Name: 6161dc72fec9
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
