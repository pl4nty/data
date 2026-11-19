-- Threat: !InfrastructureShared
-- Name: 10a7802008c6e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
