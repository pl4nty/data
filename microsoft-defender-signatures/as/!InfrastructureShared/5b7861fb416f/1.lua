-- Threat: !InfrastructureShared
-- Name: 5b7861fb416f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
