-- Threat: !InfrastructureShared
-- Name: 15b780118355a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
