-- Threat: !InfrastructureShared
-- Name: 22078ea38ae1c
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
