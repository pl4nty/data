-- Threat: !InfrastructureShared
-- Name: ae7801d08f5b
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
