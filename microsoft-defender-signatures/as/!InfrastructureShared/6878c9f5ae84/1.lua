-- Threat: !InfrastructureShared
-- Name: 6878c9f5ae84
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
