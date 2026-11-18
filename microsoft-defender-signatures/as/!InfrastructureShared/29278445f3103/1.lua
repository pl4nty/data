-- Threat: !InfrastructureShared
-- Name: 29278445f3103
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
