-- Threat: !InfrastructureShared
-- Name: 68780c846f36
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
