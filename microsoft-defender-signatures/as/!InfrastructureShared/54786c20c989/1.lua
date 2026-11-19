-- Threat: !InfrastructureShared
-- Name: 54786c20c989
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
