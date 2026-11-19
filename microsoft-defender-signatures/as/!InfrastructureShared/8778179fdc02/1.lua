-- Threat: !InfrastructureShared
-- Name: 8778179fdc02
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
