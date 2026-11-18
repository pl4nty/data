-- Threat: !InfrastructureShared
-- Name: 4e78fc3c1278
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
