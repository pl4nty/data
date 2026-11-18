-- Threat: !InfrastructureShared
-- Name: 637851b5eae2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
