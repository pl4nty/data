-- Threat: !InfrastructureShared
-- Name: 13678e8335041
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
