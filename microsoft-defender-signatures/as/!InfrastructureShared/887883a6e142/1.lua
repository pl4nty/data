-- Threat: !InfrastructureShared
-- Name: 887883a6e142
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 6000 then
  return mp.INFECTED
end
return mp.CLEAN
