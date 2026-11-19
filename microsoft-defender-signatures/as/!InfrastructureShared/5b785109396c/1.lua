-- Threat: !InfrastructureShared
-- Name: 5b785109396c
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
