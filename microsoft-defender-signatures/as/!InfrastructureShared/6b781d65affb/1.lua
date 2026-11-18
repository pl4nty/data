-- Threat: !InfrastructureShared
-- Name: 6b781d65affb
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
