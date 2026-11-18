-- Threat: !InfrastructureShared
-- Name: 14378270199a9
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN
