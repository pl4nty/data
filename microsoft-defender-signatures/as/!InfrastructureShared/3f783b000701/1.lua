-- Threat: !InfrastructureShared
-- Name: 3f783b000701
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
