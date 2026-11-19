-- Threat: !InfrastructureShared
-- Name: 5b788956f20e
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
