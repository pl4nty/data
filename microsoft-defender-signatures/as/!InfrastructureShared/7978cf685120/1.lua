-- Threat: !InfrastructureShared
-- Name: 7978cf685120
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
