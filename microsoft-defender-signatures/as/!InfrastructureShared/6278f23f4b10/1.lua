-- Threat: !InfrastructureShared
-- Name: 6278f23f4b10
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
