-- Threat: !InfrastructureShared
-- Name: 3078ff93615e
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
