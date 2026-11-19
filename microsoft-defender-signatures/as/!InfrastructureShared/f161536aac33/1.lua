-- Threat: !InfrastructureShared
-- Name: f161536aac33
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
