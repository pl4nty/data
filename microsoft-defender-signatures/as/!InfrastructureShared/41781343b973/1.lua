-- Threat: !InfrastructureShared
-- Name: 41781343b973
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
