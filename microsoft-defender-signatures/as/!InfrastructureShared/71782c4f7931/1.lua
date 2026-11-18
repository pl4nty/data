-- Threat: !InfrastructureShared
-- Name: 71782c4f7931
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 15000 then
  return mp.INFECTED
end
return mp.CLEAN
