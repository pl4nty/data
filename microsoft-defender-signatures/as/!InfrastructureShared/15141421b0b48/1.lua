-- Threat: !InfrastructureShared
-- Name: 15141421b0b48
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
