-- Threat: !InfrastructureShared
-- Name: 9178eea4c032
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
