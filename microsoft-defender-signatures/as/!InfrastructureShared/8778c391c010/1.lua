-- Threat: !InfrastructureShared
-- Name: 8778c391c010
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
