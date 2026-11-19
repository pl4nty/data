-- Threat: !InfrastructureShared
-- Name: 5978e240dd06
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
