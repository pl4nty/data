-- Threat: !InfrastructureShared
-- Name: 27788a4172b2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
