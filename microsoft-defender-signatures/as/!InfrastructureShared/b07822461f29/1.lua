-- Threat: !InfrastructureShared
-- Name: b07822461f29
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
