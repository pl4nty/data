-- Threat: !InfrastructureShared
-- Name: 24878d0e49392
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
