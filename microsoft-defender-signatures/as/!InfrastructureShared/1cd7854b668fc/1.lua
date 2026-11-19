-- Threat: !InfrastructureShared
-- Name: 1cd7854b668fc
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
